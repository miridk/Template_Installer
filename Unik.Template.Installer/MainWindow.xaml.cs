using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Management.Automation;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Unik.Template.Installer
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            this.Title = "Unik Saas Template Installer";
            this.WindowStartupLocation = WindowStartupLocation.CenterScreen;
        }

        public string company;
        public string product;
        public string area;
        public string subArea;
        public string repo;
        public string installPath;

        private void createSolutionButton_Click(object sender, RoutedEventArgs e)
        {
            company = companyTextBox.Text;
            product = productTextBox.Text;
            area = areaTextBox.Text;
            subArea = subAreaTextBox.Text;
            repo = repositoryNameTextBox.Text;
            installPath = installationPathLocalTextBox.Text;

            RunScript(company, product, area, subArea, repo, installPath);
            
        }

        public void RunScript(string company, string product, string area, string subArea, string repo, string installPath)
        {
            PowerShell ps = PowerShell.Create();
            ps.AddScript(File.ReadAllText(@"..\..\..\Scripts\New-Template-CI-Pipeline.ps1"))
                    .AddParameter(null, company)
                    .AddParameter(null, product)
                    .AddParameter(null, area)
                    .AddParameter(null, subArea)
                    .AddParameter(null, repo)
                    .AddParameter(null, installPath);
            ps.Invoke();
        }

        private void installationPathLocalButton_Click(object sender, RoutedEventArgs e)
        {

            var dialog = new Ookii.Dialogs.Wpf.VistaFolderBrowserDialog();
            dialog.Description = "Select the root folder for the repository installation";
            dialog.UseDescriptionForTitle = true;
            dialog.ShowNewFolderButton = true;

            var result = dialog.ShowDialog();
            if (result == true)
            {
                installationPathLocalTextBox.Text = dialog.SelectedPath;
            }
        }
    }
}
