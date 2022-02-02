[string]$company = $args[0];
[string]$product = $args[1];
[string]$area = $args[2];
[string]$microserviceName = $args[3];
[string]$repoName = $args[4];
[string]$installPath = $args[5];

# [string]$company = "Unik";
# [string]$product = "Bolig";
# [string]$area = "Finance";
# [string]$microserviceName = "Inkasso Unit";
# [string]$repoName = "service-inkasso_unit-dotnetdddddd";
# [string]$installPath = "C:\Udv\Midlertidig";


[string]$subArea = $microserviceName.replace(' ', '')
[string]$Filename = $microserviceName.replace(' ', '_')

[string]$fullPath = "$($company).$($product).$($area).$($subArea)"

cd $installPath
      # mkdir $repoName
git clone https://tfs.unik.dk/tfs/DefaultCollection/Bolig%20SaaS/_git/$($repoName)
cd .\$($repoName)
git checkout -b tfs/template

dotnet new --install .\Unik.WebApi.Template.1.0.1.nupkg
dotnet new UnikWebApi -o $($fullPath)
  pause
mkdir Build
  
New-Item -Path . -Name ".\Build\$($Filename)-ci.yaml" -ItemType "file" -Value "name: $($subArea)-CI
variables:
  - name: AZ_ACR_NAME
    value: titacrsharedd.azurecr.io
  - name: AZURE_SUBSCRIPTION
    value: tit-sc-d

pool:
  name: DOTNET-Linux
trigger:
  - master

steps:
  # - task: VisualStudioTestPlatformInstaller@1
  #   displayName: `"VsTest Platform Installer`"

  # - task: sonarsource.sonarqube.15B84CA1-B62F-4A2A-A403-89B77A063157.SonarQubePrepare@4
  #   displayName: `"Prepare analysis on SonarQube`"
  #   inputs:
  #     SonarQube: SonarQubeServiceConnection
  #     projectKey: $($fullPath)
  #     projectName: $($fullPath)

  - task: UseDotNet@2
    displayName: `"Install .NET Core runtime version`"
    inputs:
      version: 6.0.x
      performMultiLevelLookup: true
      includePreviewVersions: true
  - task: DotNetCoreCLI@2
    displayName: `"dotnet test`"
    inputs:
      command: test
      projects: '**\*test*.csproj'
      arguments: '--collect `"Code Coverage`"'

  - task: DotNetCoreCLI@2
    inputs:
      command: `"publish`"
      projects: `"$($fullPath)/$($fullPath).API/$($fullPath).API.csproj`"
      arguments: `"-c Release -o Output/app/publish`"
      zipAfterPublish: false
      modifyOutputPath: true

  - task: Docker@2
    displayName: Docker build and push
    inputs:
      containerRegistry: `$(AZ_ACR_NAME)
      dockerFile: `"$($fullPath)/$($fullPath).API/Dockerfile.build`"
      buildContext: `"Output/app`"
      # command: build
      repository: $($product)service
      tags: latest
    env:
      ASPNETCORE_ENVIRONMENT: Production

  # - task: sonarsource.sonarqube.6D01813A-9589-4B15-8491-8164AEB38055.SonarQubeAnalyze@4
  #   displayName: `"Run Code Analysis`"

  # - task: sonarsource.sonarqube.291ed61f-1ee4-45d3-b1b0-bf822d9095ef.SonarQubePublish@4
  #   displayName: `"Publish Quality Gate Result`"
"
  
New-Item -Path . -Name ".\$($fullPath)\$($fullPath).API\Dockerfile.build" -ItemType "file" -Value "
FROM mcr.microsoft.com/dotnet/aspnet:6.0
COPY /publish/$($fullPath).API/ app/
EXPOSE 80
EXPOSE 443
WORKDIR /app
ENTRYPOINT [`"dotnet`", `"/app/$($fullPath).API.dll`"]"

git add .
git commit -m "Template files added to project"
git push --set-upstream origin tfs/template
