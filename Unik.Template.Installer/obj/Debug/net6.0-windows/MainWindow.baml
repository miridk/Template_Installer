   M S B A M L   `   `   `  ����R  NUnik.Template.Installer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA%clr-namespace:Unik.Template.InstallerUnik.Template.Installer  5   	   (    "Unik.Template.Installer.MainWindow   5   	   W SPresentationCore, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   7local%clr-namespace:Unik.Template.Installer     5   	     � Title$  
MainWindow��5   	   $	��387��6   $	��590��6)    � 
ResizeMode$ NoResize=�65    � Icon$ /unik_icon.png��6K   .��5	      � ���	#FF1F1F21$��0,0,0,0q�6"   .+�5
   
   �� -   5         ��Name$ createSolutionButton��5
      $��Create Solution��6/   $
��Left=�6I   $��19��6d   $��438,243,0,0q�6p   $	��Top=�6�   $	��117��6�   #��� ��6�   6�   �� 5   
   -   5         ��Name$ companyTextBox��5      $
��Left=�6*   $��19��6E   $��
36,104,0,0q�6Q    �� TextWrapping$
 Wrap=�6e   $
��Unik��6y   $	��Top=�6�   $	��117��6�   ���	#FFC1C1C16�   �� 5   
   -   5        $ productTextBox��5      $
��Left=�6*   $��19��6E   $��169,104,0,0q�6Q   $
 Wrap=�6f   $��Bolig��6z   $	��Top=�6�   $	��117��6�   ���	#FFC1C1C16�   �� 5   
   -   5        $ areaTextBox��5      $
��Left=�6'   $��19��6B   $��303,104,0,0q�6N   $
 Wrap=�6c   $��Finance��6w   $	��Top=�6�   $	��117��6�   ���	#FFC1C1C16�   �� 5   
   -   5        $ subAreaTextBox��5      $
��Left=�6*   $��19��6E   $��438,104,0,0q�6Q   $
 Wrap=�6f   $��Finance Unit��6z   $	��Top=�6�   $	��117��6�   ���	#FFC1C1C16�   �� 5   
   $
��Left=�6   $��18��6/   $��	36,83,0,0q�6;   $
��Wrap=�6N   $��Company��6b   $	��Top=�6q   $	��117��6�   ���	#FFC1C1C16�   �� 5   
   $
��Left=�6   $��18��6/   $��
168,83,0,0q�6;   $
��Wrap=�6O   $��Product��6c   $	��Top=�6r   $	��117��6�   ���	#FFC1C1C16�   �� 5   
   $
��Left=�6   $��18��6/   $��
303,83,0,0q�6;   $
��Wrap=�6O   $
��Area��6c   $	��Top=�6o   $	��117��6�   ���	#FFC1C1C16�   �� 5   
   $
��Left=�6   $��18��6/   $��
438,83,0,0q�6;   $
��Wrap=�6O   $��SubArea��6c   $	��Top=�6r   $	��118��6�   ���	#FFC1C1C16�   �� 5   
   -   5        $ repositoryNameTextBox��5      $
��Left=�61   $��19��6L   $��
36,243,0,0q�6X   $
 Wrap=�6l   $!��service-finance_unit-dotnet��6�   $	��Top=�6�   $	��384��6�   ���	#FFC1C1C16�   �� 5   
   $
��Left=�6   $��18��6/   $��
36,220,0,0q�6;   $
��Wrap=�6O   $��Repository Name��6c   $	��Top=�6z   $	��117��6�   ���	#FFC1C1C16�   �� 5   
   $
��Left=�6   $��33��6+   $��	36,29,0,0q�67   $	��Top=�6J   $	��100��6b   $��/unik_logo.png��6n   �� 5   
   -   5        $" installationPathLocalTextBox��5      $
��Left=�68   $��19��6S   $��36,0,0,0q�6_   $
 Wrap=�6q   $��C:\Udv��6�   $��Center=�6�   $	��477��6�   ���	#FFC1C1C16�   �� 5   
   $
��Left=�6   $��18��6/   $��
36,151,0,0q�6;   $
��Wrap=�6O   $��Local Installation Path��6c   $	��Top=�6�   $	��117��6�   ���	#FFC1C1C16�   �� 5   
   -   5        $! installationPathLocalButton��5      $	��...��66   $
��Left=�6D   $��19��6_   $��	531,0,0,0q�6k   $��Center=�6~   $��24��6�   #��� ��6�   6�   5      5      