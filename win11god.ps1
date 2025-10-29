#region Utilitarios basicos
[CmdletBinding()]
param(
    [switch]$NoElevation
)

$script:AppName = 'win11god'
$ErrorActionPreference = 'Stop'

#region Sistema de Idiomas
# Load saved language preference or default to Portuguese
$script:CurrentLanguage = 'pt'  # Default fallback
$script:Translations = @{
    'pt' = @{
        'WindowTitle' = 'Win11God'
        'LanguageSelection' = 'Selecao de Idioma'
        'SelectLanguage' = 'Selecione seu idioma:'
        'Portuguese' = 'Portugues'
        'English' = 'English'
        'Spanish' = 'Espanol'
        'Continue' = 'Continuar'
        'General' = 'Geral'
        'Reverter' = 'Reverter'
        'Debloat' = 'Debloat'
        'About' = 'Sobre'
        'Optimizations' = 'Otimizacoes para Windows'
        'ReverterActions' = 'Acoes de Reversao'
        'Warning' = 'Atencao: Estas acoes revertem otimizacoes aplicadas anteriormente. Use com cuidado.'
        'SystemSettings' = 'Configuracoes do Sistema'
        'ReactivateFastStartup' = 'Reativar Inicializacao Rapida'
        'RevertTelemetry' = 'Reverter Configuracoes de Telemetria'
        'InterfaceAppearance' = 'Interface e Aparencia'
        'CompleteReversion' = 'Reversao Completa'
        'Cleanup' = 'Limpeza'
        'DeleteTempFiles' = 'Apagar arquivos temporarios'
        'EmptyRecycleBin' = 'Esvaziar Lixeira'
        'ClearUpdateCache' = 'Limpar cache de atualizacoes'
        'FlushDNS' = 'Limpar cache DNS'
        'ClearStoreCache' = 'Limpar cache da Microsoft Store'
        'ClearRecentFiles' = 'Limpar arquivos recentes'
        'Apply' = 'Aplicar'
        'Simulate' = 'Simular'
        'ClearAll' = 'Limpar Tudo'
        'SelectAll' = 'Selecionar Tudo'
        'Log' = 'Log'
        'ReopenAsAdmin' = 'Reabrir como Admin'
        'SaveLog' = 'Salvar Log'
        'System' = 'Sistema'
        'RestorePoint' = 'Ponto de Restauracao'
        'Performance' = 'Experiencia e Desempenho (Windows 11)'
        'Preferences' = 'Preferencias'
        'Language' = 'Idioma'
        'DisableFastStartup' = 'Desativar Inicializacao Rapida'
        'DisableTelemetry' = 'Reduzir telemetria (privacidade)'
        'CreateRestorePoint' = 'Criar ponto de restauracao antes de aplicar'
        'DisableGameBar' = 'Desativar Game Bar/DVR'
        'DisableAnimations' = 'Reduzir animacoes da interface'
        'EnableStorageSense' = 'Ativar Storage Sense (limpeza automatica)'
        'DisableSuggestions' = 'Desativar sugestoes e dicas'
        'DisableWidgets' = 'Desativar Widgets'
        'DisableBackgroundApps' = 'Desativar apps em segundo plano'
        'DisableCopilot' = 'Desativar Copilot'
        # Revert Tab translations
        'RevertActions' = 'Acoes de Reversao'
        'RevertWarning' = 'Atencao: Estas acoes revertem otimizacoes aplicadas anteriormente. Use com cuidado.'
        'ReactivateFastStartupBtn' = 'Reativar Inicializacao Rapida'
        'RevertTelemetrySettingsBtn' = 'Reverter Configuracoes de Telemetria'
        'RestoreDisabledServices' = 'Restaurar Servicos Desabilitados'
        'RestoreDefaultTaskbar' = 'Restaurar Barra de Tarefas Padrao'
        'RestoreOriginalStartMenu' = 'Restaurar Menu Iniciar Original'
        'RestoreWin11ContextMenu' = 'Restaurar Menu de Contexto Win11'
        'RevertAllOptimizations' = 'Reverter Todas as Otimizacoes'
        'RestoreSystemOriginalState' = 'Restaura o sistema ao estado original'
        # Debloat Tab translations
        'AppsKeep' = 'Apps Recomendados Manter'
        'Calculator' = 'Calculadora'
        'MicrosoftStore' = 'Microsoft Store'
        'Photos' = 'Fotos'
        'Notepad' = 'Bloco de Notas'
        'AppsRemove' = 'Apps Recomendados Remover'
        'CandyCrush' = 'Candy Crush Saga'
        'Xbox' = 'Xbox (Game Bar, Identity Provider)'
        'Skype' = 'Skype'
        'GrooveMusic' = 'Groove Music'
        'MoviesTV' = 'Filmes e TV'
        'MicrosoftNews' = 'Microsoft News'
        'Weather' = 'Clima'
        'Maps' = 'Mapas'
        '3DViewer' = 'Visualizador 3D'
        'HeavyServices' = 'Servicos Pesados (Avancado)'
        'WindowsSearch' = 'Windows Search (Indexacao)'
        'FaxService' = 'Servico de Fax'
        'TabletInput' = 'Tablet PC Input Service'
        # About Tab translations
        'AppName' = 'Win11God'
        'AppDescription' = 'UI estilo Windows 11. Execute como administrador.'
        'AppInstructions' = 'Selecione as otimizacoes e clique em Aplicar.'
        'LanguageInfo' = 'Linguagem: PowerShell (WPF)'
        'Developer' = 'Desenvolvedor'
        'OfficialSite' = 'Site oficial'
        'Portfolio' = 'Portfolio'
        'YouTube' = 'YouTube'
        'Discord' = 'Discord'
        
        # Botoes Debloat
        'btnApplyDebloat' = 'Aplicar Debloat'
        'btnSimulateDebloat' = 'Simular'
        'btnSelectAllDebloat' = 'Selecionar Tudo'
        'btnClearAllDebloat' = 'Limpar Tudo'
    }
    'en' = @{
        'WindowTitle' = 'Win11God'
        'LanguageSelection' = 'Language Selection'
        'SelectLanguage' = 'Select your language:'
        'Portuguese' = 'Portugues'
        'English' = 'English'
        'Spanish' = 'Espanol'
        'Continue' = 'Continue'
        'General' = 'General'
        'Reverter' = 'Revert'
        'Debloat' = 'Debloat'
        'About' = 'About'
        'Optimizations' = 'Windows Optimizations'
        'ReverterActions' = 'Reversion Actions'
        'Warning' = 'Warning: These actions revert previously applied optimizations. Use with caution.'
        'SystemSettings' = 'System Settings'
        'ReactivateFastStartup' = 'Reactivate Fast Startup'
        'RevertTelemetry' = 'Revert Telemetry Settings'
        'InterfaceAppearance' = 'Interface and Appearance'
        'CompleteReversion' = 'Complete Reversion'
        'Cleanup' = 'Cleanup'
        'DeleteTempFiles' = 'Delete temporary files'
        'EmptyRecycleBin' = 'Empty Recycle Bin'
        'ClearUpdateCache' = 'Clear update cache'
        'FlushDNS' = 'Flush DNS cache'
        'ClearStoreCache' = 'Clear Microsoft Store cache'
        'ClearRecentFiles' = 'Clear recent files'
        'Apply' = 'Apply'
        'Simulate' = 'Simulate'
        'ClearAll' = 'Clear All'
        'SelectAll' = 'Select All'
        'Log' = 'Log'
        'ReopenAsAdmin' = 'Reopen as Admin'
        'SaveLog' = 'Save Log'
        'System' = 'System'
        'RestorePoint' = 'Restore Point'
        'Performance' = 'Experience and Performance (Windows 11)'
        'Preferences' = 'Preferences'
        'Language' = 'Language'
        'DisableFastStartup' = 'Disable Fast Startup'
        'DisableTelemetry' = 'Reduce telemetry (privacy)'
        'CreateRestorePoint' = 'Create restore point before applying'
        'DisableGameBar' = 'Disable Game Bar/DVR'
        'DisableAnimations' = 'Reduce interface animations'
        'EnableStorageSense' = 'Enable Storage Sense (automatic cleanup)'
        'DisableSuggestions' = 'Disable suggestions and tips'
        'DisableWidgets' = 'Disable Widgets'
        'DisableBackgroundApps' = 'Disable background apps'
        'DisableCopilot' = 'Disable Copilot'
        # Revert Tab translations
        'RevertActions' = 'Reversion Actions'
        'RevertWarning' = 'Warning: These actions revert previously applied optimizations. Use with caution.'
        'ReactivateFastStartupBtn' = 'Reactivate Fast Startup'
        'RevertTelemetrySettingsBtn' = 'Revert Telemetry Settings'
        'RestoreDisabledServices' = 'Restore Disabled Services'
        'RestoreDefaultTaskbar' = 'Restore Default Taskbar'
        'RestoreOriginalStartMenu' = 'Restore Original Start Menu'
        'RestoreWin11ContextMenu' = 'Restore Win11 Context Menu'
        'RevertAllOptimizations' = 'Revert All Optimizations'
        'RestoreSystemOriginalState' = 'Restores system to original state'
        # Debloat Tab translations
        'AppsKeep' = 'Recommended Apps to Keep'
        'Calculator' = 'Calculator'
        'MicrosoftStore' = 'Microsoft Store'
        'Photos' = 'Photos'
        'Notepad' = 'Notepad'
        'AppsRemove' = 'Recommended Apps to Remove'
        'CandyCrush' = 'Candy Crush Saga'
        'Xbox' = 'Xbox (Game Bar, Identity Provider)'
        'Skype' = 'Skype'
        'GrooveMusic' = 'Groove Music'
        'MoviesTV' = 'Movies & TV'
        'MicrosoftNews' = 'Microsoft News'
        'Weather' = 'Weather'
        'Maps' = 'Maps'
        '3DViewer' = '3D Viewer'
        'HeavyServices' = 'Heavy Services (Advanced)'
        'WindowsSearch' = 'Windows Search (Indexing)'
        'FaxService' = 'Fax Service'
        'TabletInput' = 'Tablet PC Input Service'
        # About Tab translations
        'AppName' = 'Win11God'
        'AppDescription' = 'Windows 11 style UI. Run as administrator.'
        'AppInstructions' = 'Select optimizations and click Apply.'
        'LanguageInfo' = 'Language: PowerShell (WPF)'
        'Developer' = 'Developer'
        'OfficialSite' = 'Official Site'
        'Portfolio' = 'Portfolio'
        'YouTube' = 'YouTube'
        'Discord' = 'Discord'
        
        # Debloat Buttons
        'btnApplyDebloat' = 'Apply Debloat'
        'btnSimulateDebloat' = 'Simulate'
        'btnSelectAllDebloat' = 'Select All'
        'btnClearAllDebloat' = 'Clear All'
    }
    'es' = @{
        'WindowTitle' = 'Win11God'
        'LanguageSelection' = 'Seleccion de Idioma'
        'SelectLanguage' = 'Selecciona tu idioma:'
        'Portuguese' = 'Portugues'
        'English' = 'English'
        'Spanish' = 'Espanol'
        'Continue' = 'Continuar'
        'General' = 'General'
        'Reverter' = 'Revertir'
        'Debloat' = 'Debloat'
        'About' = 'Acerca de'
        'Optimizations' = 'Optimizaciones para Windows'
        'ReverterActions' = 'Acciones de Reversion'
        'Warning' = 'Advertencia: Estas acciones revierten optimizaciones aplicadas anteriormente. Usar con precaucion.'
        'SystemSettings' = 'Configuraciones del Sistema'
        'ReactivateFastStartup' = 'Reactivar Inicio Rapido'
        'RevertTelemetry' = 'Revertir Configuraciones de Telemetria'
        'InterfaceAppearance' = 'Interfaz y Apariencia'
        'CompleteReversion' = 'Reversion Completa'
        'Cleanup' = 'Limpieza'
        'DeleteTempFiles' = 'Eliminar archivos temporales'
        'EmptyRecycleBin' = 'Vaciar Papelera de Reciclaje'
        'ClearUpdateCache' = 'Limpiar cache de actualizaciones'
        'FlushDNS' = 'Limpiar cache DNS'
        'ClearStoreCache' = 'Limpiar cache de Microsoft Store'
        'ClearRecentFiles' = 'Limpiar archivos recientes'
        'Apply' = 'Aplicar'
        'Simulate' = 'Simular'
        'ClearAll' = 'Limpiar Todo'
        'SelectAll' = 'Seleccionar Todo'
        'Log' = 'Registro'
        'ReopenAsAdmin' = 'Reabrir como Admin'
        'SaveLog' = 'Guardar Registro'
        'System' = 'Sistema'
        'RestorePoint' = 'Punto de Restauracion'
        'Performance' = 'Experiencia y Rendimiento (Windows 11)'
        'Preferences' = 'Preferencias'
        'Language' = 'Idioma'
        'DisableFastStartup' = 'Desactivar Inicio Rapido'
        'DisableTelemetry' = 'Reducir telemetria (privacidad)'
        'CreateRestorePoint' = 'Crear punto de restauracion antes de aplicar'
        'DisableGameBar' = 'Desactivar Game Bar/DVR'
        'DisableAnimations' = 'Reducir animaciones de la interfaz'
        'EnableStorageSense' = 'Activar Storage Sense (limpieza automatica)'
        'DisableSuggestions' = 'Desactivar sugerencias y consejos'
        'DisableWidgets' = 'Desactivar Widgets'
        'DisableBackgroundApps' = 'Desactivar aplicaciones en segundo plano'
        'DisableCopilot' = 'Desactivar Copilot'
        # Revert Tab translations
        'RevertActions' = 'Acciones de Reversion'
        'RevertWarning' = 'Advertencia: Estas acciones revierten optimizaciones aplicadas anteriormente. Usar con precaucion.'
        'ReactivateFastStartupBtn' = 'Reactivar Inicio Rapido'
        'RevertTelemetrySettingsBtn' = 'Revertir Configuraciones de Telemetria'
        'RestoreDisabledServices' = 'Restaurar Servicios Deshabilitados'
        'RestoreDefaultTaskbar' = 'Restaurar Barra de Tareas Predeterminada'
        'RestoreOriginalStartMenu' = 'Restaurar Menu Inicio Original'
        'RestoreWin11ContextMenu' = 'Restaurar Menu Contextual Win11'
        'RevertAllOptimizations' = 'Revertir Todas las Optimizaciones'
        'RestoreSystemOriginalState' = 'Restaura el sistema al estado original'
        # Debloat Tab translations
        'AppsKeep' = 'Aplicaciones Recomendadas Mantener'
        'Calculator' = 'Calculadora'
        'MicrosoftStore' = 'Microsoft Store'
        'Photos' = 'Fotos'
        'Notepad' = 'Bloc de Notas'
        'AppsRemove' = 'Aplicaciones Recomendadas Eliminar'
        'CandyCrush' = 'Candy Crush Saga'
        'Xbox' = 'Xbox (Game Bar, Identity Provider)'
        'Skype' = 'Skype'
        'GrooveMusic' = 'Groove Music'
        'MoviesTV' = 'Peliculas y TV'
        'MicrosoftNews' = 'Microsoft News'
        'Weather' = 'Clima'
        'Maps' = 'Mapas'
        '3DViewer' = 'Visor 3D'
        'HeavyServices' = 'Servicios Pesados (Avanzado)'
        'WindowsSearch' = 'Windows Search (Indexacion)'
        'FaxService' = 'Servicio de Fax'
        'TabletInput' = 'Servicio de Entrada de Tablet PC'
        # About Tab translations
        'AppName' = 'Win11God'
        'AppDescription' = 'Interfaz estilo Windows 11. Ejecutar como administrador.'
        'AppInstructions' = 'Selecciona las optimizaciones y haz clic en Aplicar.'
        'LanguageInfo' = 'Lenguaje: PowerShell (WPF)'
        'Developer' = 'Desarrollador'
        'OfficialSite' = 'Sitio Oficial'
        'Portfolio' = 'Portafolio'
        'YouTube' = 'YouTube'
        'Discord' = 'Discord'
        
        # Botones Debloat
        'btnApplyDebloat' = 'Aplicar Debloat'
        'btnSimulateDebloat' = 'Simular'
        'btnSelectAllDebloat' = 'Seleccionar Todo'
        'btnClearAllDebloat' = 'Limpiar Todo'
    }
}

function Get-Translation {
    param([string]$Key)
    return $script:Translations[$script:CurrentLanguage][$Key]
}

function Get-LanguagePreference {
    $configPath = Join-Path -Path $env:APPDATA -ChildPath "Win11God\language.json"
    if (Test-Path $configPath) {
        try {
            $config = Get-Content -Path $configPath | ConvertFrom-Json
            return $config.Language
        }
        catch {
            return "pt"  # Default to Portuguese if config is corrupted
        }
    }
    return "pt"  # Default to Portuguese if no config exists
}

function Save-LanguagePreference {
    param([string]$Language)
    $configDir = Join-Path -Path $env:APPDATA -ChildPath "Win11God"
    $configPath = Join-Path -Path $configDir -ChildPath "language.json"
    
    # Create directory if it doesn't exist
    if (-not (Test-Path $configDir)) {
        New-Item -ItemType Directory -Path $configDir -Force | Out-Null
    }
    
    $config = @{
        Language = $Language
        LastUpdated = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    }
    
    $config | ConvertTo-Json | Set-Content -Path $configPath -Encoding UTF8
}

function Show-LanguageSelection {
    $languageXaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="$(Get-Translation 'LanguageSelection')" Height="300" Width="400"
        WindowStartupLocation="CenterScreen" ResizeMode="NoResize"
        Background="#000000" Foreground="#F3F3F3"
        WindowStyle="None" AllowsTransparency="True"
        BorderBrush="#2B2B2B" BorderThickness="1">
    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="40"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="60"/>
        </Grid.RowDefinitions>
        
        <!-- Title Bar -->
        <Border Grid.Row="0" Background="#1A1A1A" BorderBrush="#2B2B2B" BorderThickness="0,0,0,1">
            <Grid>
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="*"/>
                    <ColumnDefinition Width="Auto"/>
                </Grid.ColumnDefinitions>
                
                <StackPanel Grid.Column="0" Orientation="Horizontal" VerticalAlignment="Center" Margin="12,0,0,0">
                    <TextBlock Text="$(Get-Translation 'LanguageSelection')" FontSize="14" FontWeight="Bold" Foreground="#FFFFFF" VerticalAlignment="Center"/>
                </StackPanel>
                
                <Button Grid.Column="1" x:Name="CloseLanguageButton" Content="&#xE8BB;" 
                        FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" FontSize="12" 
                        Width="40" Height="40" Background="Transparent" Foreground="#FFFFFF" 
                        BorderThickness="0" HorizontalAlignment="Right"/>
            </Grid>
        </Border>
        
        <!-- Content -->
        <StackPanel Grid.Row="1" Margin="40,30,40,20" VerticalAlignment="Center">
            <TextBlock Text="$(Get-Translation 'SelectLanguage')" FontSize="16" FontWeight="SemiBold" 
                       HorizontalAlignment="Center" Margin="0,0,0,20"/>
            
            <StackPanel Orientation="Vertical" HorizontalAlignment="Center">
                <Button x:Name="btnPortuguese" Content="🇧🇷 $(Get-Translation 'Portuguese')" 
                        Width="200" Height="40" Margin="0,5" FontSize="14"
                        Background="#1A1A1A" Foreground="#FFFFFF" BorderBrush="#3B82F6" BorderThickness="1"/>
                <Button x:Name="btnEnglish" Content="🇺🇸 $(Get-Translation 'English')" 
                        Width="200" Height="40" Margin="0,5" FontSize="14"
                        Background="#1A1A1A" Foreground="#FFFFFF" BorderBrush="#3B82F6" BorderThickness="1"/>
                <Button x:Name="btnSpanish" Content="🇪🇸 $(Get-Translation 'Spanish')" 
                        Width="200" Height="40" Margin="0,5" FontSize="14"
                        Background="#1A1A1A" Foreground="#FFFFFF" BorderBrush="#3B82F6" BorderThickness="1"/>
            </StackPanel>
        </StackPanel>
    </Grid>
</Window>
"@

    $reader = New-Object System.Xml.XmlNodeReader ([xml]$languageXaml)
    $languageWindow = [Windows.Markup.XamlReader]::Load($reader)
    
    $btnPortuguese = $languageWindow.FindName('btnPortuguese')
    $btnEnglish = $languageWindow.FindName('btnEnglish')
    $btnSpanish = $languageWindow.FindName('btnSpanish')
    $CloseLanguageButton = $languageWindow.FindName('CloseLanguageButton')
    
    $btnPortuguese.Add_Click({
        $script:CurrentLanguage = 'pt'
        Save-LanguagePreference -Language 'pt'
        $languageWindow.DialogResult = $true
        $languageWindow.Close()
    })
    
    $btnEnglish.Add_Click({
        $script:CurrentLanguage = 'en'
        Save-LanguagePreference -Language 'en'
        $languageWindow.DialogResult = $true
        $languageWindow.Close()
    })
    
    $btnSpanish.Add_Click({
        $script:CurrentLanguage = 'es'
        Save-LanguagePreference -Language 'es'
        $languageWindow.DialogResult = $true
        $languageWindow.Close()
    })
    
    $CloseLanguageButton.Add_Click({
        $languageWindow.DialogResult = $false
        $languageWindow.Close()
    })
    
    $result = $languageWindow.ShowDialog()
    if (-not $result) {
        # Se o usuário fechar sem selecionar, usar português como padrão
        $script:CurrentLanguage = 'pt'
    }
}
#endregion Sistema de Idiomas

function Write-LogUI {
    param(
        [string]$Message,
        [string]$Level = 'INFO'
    )
    $ts = (Get-Date).ToString('yyyy-MM-dd HH:mm:ss')
    $line = "[$ts] [$Level] $Message"
    Write-Host $line
    if ($script:LogBox -and $script:LogBox.IsLoaded) {
        $append = {
            $null = $script:LogBox.AppendText($line + [Environment]::NewLine)
            $script:LogBox.ScrollToEnd()
        }
        if ($script:Window -and $script:Window.Dispatcher) {
            $script:Window.Dispatcher.Invoke($append)
        } else {
            & $append
        }
    }
}

function Test-IsAdmin {
    try {
        $currentIdentity = [Security.Principal.WindowsIdentity]::GetCurrent()
        $principal = New-Object Security.Principal.WindowsPrincipal($currentIdentity)
        return $principal.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
    } catch {
        return $false
    }
}

function Test-Admin {
    if (-not (Test-IsAdmin)) {
        if ($NoElevation) {
            Write-LogUI "Execucao sem elevacao (modo sem elevacao). Algumas acoes podem falhar." 'WARN'
        } else {
            Write-LogUI "Executando sem privilegios de administrador. Algumas acoes podem falhar." 'WARN'
            # Removido o Restart-Admin para permitir que as otimizacoes continuem
            # O usuario pode executar manualmente como administrador se necessario
        }
    }
}

# Reinicia o script com elevacao de administrador e encerra a instancia atual
function Restart-Admin {
    try {
        $scriptPath = if ($PSCommandPath) { $PSCommandPath } else { $MyInvocation.MyCommand.Path }
        $psi = New-Object System.Diagnostics.ProcessStartInfo
        $psi.FileName = 'powershell.exe'
        $psi.Arguments = "-ExecutionPolicy Bypass -NoProfile -File `"$scriptPath`""
        $psi.Verb = 'runas'
        [System.Diagnostics.Process]::Start($psi) | Out-Null
        if ($script:Window) { $script:Window.Close() }
        exit 0
    } catch {
        # Usuario pode ter cancelado o UAC; seguir sem admin
        Write-LogUI "Elevacao cancelada ou falhou: $($_.Exception.Message)" 'WARN'
    }
}

function Invoke-Safely {
    param(
        [scriptblock]$Action,
        [string]$Description
    )
    try {
        Write-LogUI "Iniciando: $Description"
        $output = & $Action *>&1
        if ($null -ne $output) {
            # Escreve cada linha de saida no log
            ($output | Out-String).TrimEnd().Split([Environment]::NewLine) | ForEach-Object {
                if ($_ -and $_.Trim()) { Write-LogUI $_ }
            }
        }
        Write-LogUI "Concluido: $Description" 'SUCCESS'
        return $true
    } catch {
        Write-LogUI "Falha em '$Description': $($_.Exception.Message)" 'ERROR'
        return $false
    }
}

function Get-AppIcon {
    param(
        [string]$IconUrl = 'https://raw.githubusercontent.com/aMathyzinn/Win11God/refs/heads/main/win11god.ico'
    )
    
    try {
        # Criar diretorio AppData/Local/Win11God se nao existir
        $appDataPath = [Environment]::GetFolderPath('LocalApplicationData')
        $win11godPath = Join-Path $appDataPath 'Win11God'
        $iconPath = Join-Path $win11godPath 'win11god.ico'
        
        if (-not (Test-Path $win11godPath)) {
            New-Item -Path $win11godPath -ItemType Directory -Force | Out-Null
            Write-LogUI "Diretorio criado: $win11godPath"
        }
        
        # Verificar se o icone ja existe e nao esta muito antigo (7 dias)
        if (Test-Path $iconPath) {
            $iconAge = (Get-Date) - (Get-Item $iconPath).LastWriteTime
            if ($iconAge.TotalDays -lt 7) {
                Write-LogUI "Usando icone em cache: $iconPath"
                return $iconPath
            }
        }
        
        # Baixar o icone do GitHub
        Write-LogUI "Baixando icone do GitHub..."
        $webClient = New-Object System.Net.WebClient
        $webClient.DownloadFile($IconUrl, $iconPath)
        Write-LogUI "Icone baixado com sucesso: $iconPath"
        
        return $iconPath
    } catch {
        Write-LogUI "Erro ao baixar icone: $($_.Exception.Message)" 'WARN'
        # Retornar null se falhar - a aplicacao funcionara sem icone
        return $null
    }
}

function Get-AppIconPNG {
    param(
        [string]$IconUrl = 'https://raw.githubusercontent.com/aMathyzinn/Win11God/refs/heads/main/win11god.png'
    )
    
    try {
        # Criar diretorio AppData/Local/Win11God se nao existir
        $appDataPath = [Environment]::GetFolderPath('LocalApplicationData')
        $win11godPath = Join-Path $appDataPath 'Win11God'
        $iconPath = Join-Path $win11godPath 'win11god.png'
        
        if (-not (Test-Path $win11godPath)) {
            New-Item -Path $win11godPath -ItemType Directory -Force | Out-Null
            Write-LogUI "Diretorio criado: $win11godPath"
        }
        
        # Verificar se o icone PNG ja existe e nao esta muito antigo (7 dias)
        if (Test-Path $iconPath) {
            $iconAge = (Get-Date) - (Get-Item $iconPath).LastWriteTime
            if ($iconAge.TotalDays -lt 7) {
                Write-LogUI "Usando icone PNG em cache: $iconPath"
                return $iconPath
            }
        }
        
        # Baixar o icone PNG do GitHub
        Write-LogUI "Baixando icone PNG do GitHub..."
        $webClient = New-Object System.Net.WebClient
        $webClient.DownloadFile($IconUrl, $iconPath)
        Write-LogUI "Icone PNG baixado com sucesso: $iconPath"
        
        return $iconPath
    } catch {
        Write-LogUI "Erro ao baixar icone PNG: $($_.Exception.Message)" 'WARN'
        # Retornar null se falhar - a aplicacao funcionara sem icone
        return $null
    }
}

#region Ambiente/Compatibilidade
function Get-OSVersionInfo {
    try {
        $cv = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion'
        $buildStr = $cv.CurrentBuild
        if (-not $buildStr) { $buildStr = $cv.CurrentBuildNumber }
        $build = 0
        try { $build = [int]$buildStr } catch { $build = 0 }
        $isWin11 = ($cv.ProductName -like '*Windows 11*') -or ($build -ge 22000)
        [pscustomobject]@{
            ProductName      = $cv.ProductName
            EditionID        = $cv.EditionID
            DisplayVersion   = $cv.DisplayVersion
            ReleaseId        = $cv.ReleaseId
            CurrentBuild     = $build
            UBR              = $cv.UBR
            IsWindows11      = [bool]$isWin11
        }
    } catch {
        Write-LogUI "Nao foi possivel obter informacoes de versao do Windows: $($_.Exception.Message)" 'WARN'
        [pscustomobject]@{ ProductName=''; EditionID=''; DisplayVersion=''; ReleaseId=''; CurrentBuild=0; UBR=0; IsWindows11=$false }
    }
}

function Test-IsWindows11 {
    $info = Get-OSVersionInfo
    if (-not $info.IsWindows11) {
        Write-LogUI 'Algumas otimizacoes foram projetadas para Windows 11. Prosseguindo com cautela.' 'WARN'
        return $false
    }
    return $true
}
#endregion Ambiente/Compatibilidade

#endregion Utilitarios basicos

#region Otimizacoes

function New-RestorePoint {
    try {
        Write-LogUI 'Criando ponto de restauracao...'
        Checkpoint-Computer -Description 'win11god' -RestorePointType 'MODIFY_SETTINGS'
        Write-LogUI 'Ponto de restauracao criado.' 'SUCCESS'
        return $true
    } catch {
        Write-LogUI "Nao foi possivel criar ponto de restauracao: $($_.Exception.Message)" 'WARN'
        return $false
    }
}

function Optimize-CleanTemp {
    $paths = @(
        $env:TEMP,
        $env:TMP,
        "$env:LOCALAPPDATA\Temp",
        'C:\Windows\Temp'
    ) | Select-Object -Unique | Where-Object { $_ -and (Test-Path $_) }

    foreach ($p in $paths) {
        Write-LogUI "Limpando: $p"
        try {
            Get-ChildItem -LiteralPath $p -Force -ErrorAction SilentlyContinue | ForEach-Object {
                try {
                    if ($_.PSIsContainer) {
                        Remove-Item -LiteralPath $_.FullName -Recurse -Force -ErrorAction SilentlyContinue
                    } else {
                        Remove-Item -LiteralPath $_.FullName -Force -ErrorAction SilentlyContinue
                    }
                } catch {
                    Write-LogUI "Nao foi possivel remover: $($_.FullName)" 'WARN'
                }
            }
        } catch {
            Write-LogUI "Falha ao enumerar ${p}: $($_.Exception.Message)" 'WARN'
        }
    }
}

function Optimize-EmptyRecycleBin {
    try {
        Write-LogUI 'Esvaziando Lixeira...'
        Start-Process -FilePath 'cmd.exe' -ArgumentList '/c', 'rundll32.exe shell32.dll,SHEmptyRecycleBinW 0 0x00000001' -WindowStyle Hidden -Wait
        Write-LogUI 'Lixeira esvaziada.' 'SUCCESS'
    } catch {
        Write-LogUI "Falha ao esvaziar lixeira: $($_.Exception.Message)" 'WARN'
    }
}

function Optimize-FlushDNS {
    try {
        Write-LogUI 'Limpando cache DNS...'
        ipconfig /flushdns | Out-Null
        Write-LogUI 'Cache DNS limpo.' 'SUCCESS'
    } catch {
        Write-LogUI "Falha ao limpar DNS: $($_.Exception.Message)" 'WARN'
    }
}

function Optimize-ClearWinUpdateCache {
    try {
        Write-LogUI 'Limpando cache do Windows Update...'
        $services = 'wuauserv','bits','cryptsvc'
        foreach ($svc in $services) {
            $existing = Get-Service -Name $svc -ErrorAction SilentlyContinue
            if ($existing) { Stop-Service $svc -ErrorAction SilentlyContinue -Force }
        }

        $paths = @(
            'C:\Windows\SoftwareDistribution\Download',
            'C:\Windows\SoftwareDistribution\DataStore\DataStore.edb',
            'C:\Windows\System32\catroot2'
        )
        foreach ($p in $paths) {
            if (Test-Path $p) {
                try { Remove-Item -LiteralPath $p -Recurse -Force -ErrorAction SilentlyContinue } catch { Write-LogUI "Falha ao remover ${p}: $($_.Exception.Message)" 'WARN' }
            }
        }
        foreach ($svc in $services) {
            $existing = Get-Service -Name $svc -ErrorAction SilentlyContinue
            if ($existing) { Start-Service $svc -ErrorAction SilentlyContinue }
        }
        Write-LogUI 'Cache do Windows Update limpo.' 'SUCCESS'
    } catch {
        Write-LogUI "Falha ao limpar cache do Windows Update: $($_.Exception.Message)" 'WARN'
    }
}

function Optimize-ClearStoreCache {
    try {
        Write-LogUI 'Limpando cache da Microsoft Store...'
        $wsreset = (Get-Command -Name 'wsreset.exe' -ErrorAction SilentlyContinue)
        if ($wsreset) {
            Start-Process -FilePath $wsreset.Source -WindowStyle Hidden -Wait
        } else {
            Write-LogUI 'wsreset.exe nao encontrado. Pulando limpeza da Store.' 'WARN'
            return
        }
        Write-LogUI 'Cache da Microsoft Store limpo.' 'SUCCESS'
    } catch {
        Write-LogUI "Falha ao limpar cache da Store: $($_.Exception.Message)" 'WARN'
    }
}

function Optimize-DisableFastStartup {
    try {
        Write-LogUI 'Desativando Inicializacao Rapida...'
        $path = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power'
        New-Item -Path $path -Force | Out-Null
        $cur = $null
        try { $cur = (Get-ItemProperty -Path $path -Name 'HiberbootEnabled' -ErrorAction SilentlyContinue).HiberbootEnabled } catch {}
        if ($cur -eq 0) {
            Write-LogUI 'Inicializacao Rapida ja estava desativada.' 'INFO'
        } else {
            New-ItemProperty -Path $path -Name 'HiberbootEnabled' -Value 0 -PropertyType DWord -Force | Out-Null
            Write-LogUI 'Inicializacao Rapida desativada.' 'SUCCESS'
        }
    } catch {
        Write-LogUI "Falha ao desativar Inicializacao Rapida: $($_.Exception.Message)" 'WARN'
    }
}

function Restore-FastStartup {
    try {
        Write-LogUI 'Reativando Inicializacao Rapida...'
        $path = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power'
        New-Item -Path $path -Force | Out-Null
        $cur = $null
        try { $cur = (Get-ItemProperty -Path $path -Name 'HiberbootEnabled' -ErrorAction SilentlyContinue).HiberbootEnabled } catch {}
        if ($cur -eq 1) {
            Write-LogUI 'Inicializacao Rapida ja estava ativa.' 'INFO'
        } else {
            New-ItemProperty -Path $path -Name 'HiberbootEnabled' -Value 1 -PropertyType DWord -Force | Out-Null
            Write-LogUI 'Inicializacao Rapida reativada.' 'SUCCESS'
        }
    } catch {
        Write-LogUI "Falha ao reativar Inicializacao Rapida: $($_.Exception.Message)" 'WARN'
    }
}

function Optimize-DisableTelemetry {
    try {
        Write-LogUI 'Ajustando Telemetria...'
        $info = Get-OSVersionInfo
        $edition = $info.EditionID
        $minTelemetry = if ($edition -in @('Enterprise','Education','EnterpriseS','ServerStandard','ServerDatacenter')) { 0 } else { 1 }
        New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Force | Out-Null
        New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -Value $minTelemetry -PropertyType DWord -Force | Out-Null
        Write-LogUI ("Telemetria ajustada para {0}." -f $minTelemetry) 'SUCCESS'
        try {
            # Desativar servico de telemetria quando existir
            $svc = Get-Service -Name 'DiagTrack' -ErrorAction SilentlyContinue
            if ($svc) {
                Stop-Service -Name 'DiagTrack' -Force -ErrorAction SilentlyContinue
                Set-Service -Name 'DiagTrack' -StartupType Disabled -ErrorAction SilentlyContinue
                Write-LogUI 'Servico DiagTrack desativado.' 'SUCCESS'
            }
        } catch {
            Write-LogUI "Falha ao ajustar servico de telemetria: $($_.Exception.Message)" 'WARN'
        }
    } catch {
        Write-LogUI "Falha ao ajustar Telemetria: $($_.Exception.Message)" 'WARN'
    }
}

function Restore-Telemetry {
    try {
        Write-LogUI 'Revertendo Telemetria...'
        Remove-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -Force -ErrorAction SilentlyContinue
        try {
            $svc = Get-Service -Name 'DiagTrack' -ErrorAction SilentlyContinue
            if ($svc) {
                Set-Service -Name 'DiagTrack' -StartupType Automatic -ErrorAction SilentlyContinue
                Start-Service -Name 'DiagTrack' -ErrorAction SilentlyContinue
                Write-LogUI 'Servico DiagTrack reativado.' 'SUCCESS'
            }
        } catch {
            Write-LogUI "Falha ao reativar servico de telemetria: $($_.Exception.Message)" 'WARN'
        }
        Write-LogUI 'Telemetria revertida.' 'SUCCESS'
    } catch {
        Write-LogUI "Falha ao reverter Telemetria: $($_.Exception.Message)" 'WARN'
    }
}

function Optimize-ClearRecentFiles {
    try {
        Write-LogUI 'Limpando Arquivos Recentes...'
        $recent = "$env:APPDATA\Microsoft\Windows\Recent"
        $recentAuto = "$recent\AutomaticDestinations"
        $recentCustom = "$recent\CustomDestinations"
        foreach ($p in @($recentAuto,$recentCustom)) {
            if (Test-Path $p) {
                Get-ChildItem $p -Force -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
            }
        }
        Write-LogUI 'Recentes e Jump Lists limpos.' 'SUCCESS'
    } catch {
        Write-LogUI "Falha ao limpar recentes: $($_.Exception.Message)" 'WARN'
    }
}

#region Debloat Functions

function Remove-WindowsApp {
    param([string]$AppName, [string]$DisplayName)
    try {
        Write-LogUI "Removendo: $DisplayName"
        
        # Tentar remover via Get-AppxPackage (apps UWP)
        $packages = Get-AppxPackage -Name "*$AppName*" -AllUsers -ErrorAction SilentlyContinue
        foreach ($pkg in $packages) {
            try {
                Remove-AppxPackage -Package $pkg.PackageFullName -AllUsers -ErrorAction SilentlyContinue
                Write-LogUI "Removido pacote: $($pkg.Name)" 'SUCCESS'
            } catch {
                Write-LogUI "Falha ao remover pacote $($pkg.Name): $($_.Exception.Message)" 'WARN'
            }
        }
        
        # Tentar remover provisioned packages (para novos usuarios)
        $provPackages = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "*$AppName*" }
        foreach ($pkg in $provPackages) {
            try {
                Remove-AppxProvisionedPackage -Online -PackageName $pkg.PackageName -ErrorAction SilentlyContinue
                Write-LogUI "Removido pacote provisionado: $($pkg.DisplayName)" 'SUCCESS'
            } catch {
                Write-LogUI "Falha ao remover pacote provisionado $($pkg.DisplayName): $($_.Exception.Message)" 'WARN'
            }
        }
        
        return $true
    } catch {
        Write-LogUI "Falha ao remover ${DisplayName}: $($_.Exception.Message)" 'ERROR'
        return $false
    }
}

function Disable-WindowsService {
    param([string]$ServiceName, [string]$DisplayName)
    try {
        Write-LogUI "Desabilitando servico: $DisplayName"
        $service = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue
        if ($service) {
            Stop-Service -Name $ServiceName -Force -ErrorAction SilentlyContinue
            Set-Service -Name $ServiceName -StartupType Disabled -ErrorAction SilentlyContinue
            Write-LogUI "Servico $DisplayName desabilitado." 'SUCCESS'
        } else {
            Write-LogUI "Servico $ServiceName nao encontrado." 'WARN'
        }
        return $true
    } catch {
        Write-LogUI "Falha ao desabilitar servico ${DisplayName}: $($_.Exception.Message)" 'ERROR'
        return $false
    }
}

function Enable-WindowsService {
    param([string]$ServiceName, [string]$DisplayName)
    try {
        Write-LogUI "Habilitando servico: $DisplayName"
        Set-Service -Name $ServiceName -StartupType Automatic -ErrorAction SilentlyContinue
        Start-Service -Name $ServiceName -ErrorAction SilentlyContinue
        Write-LogUI "Servico $DisplayName habilitado." 'SUCCESS'
        return $true
    } catch {
        Write-LogUI "Falha ao habilitar servico ${DisplayName}: $($_.Exception.Message)" 'ERROR'
        return $false
    }
}

#endregion Debloat Functions

#endregion Otimizacoes

#region UI XAML
Add-Type -AssemblyName PresentationCore,PresentationFramework,WindowsBase

#region Backdrop (Mica/Acrylic) Win11
$nativeCode = @"
using System;
using System.Runtime.InteropServices;
namespace Win32 {
  public static class NativeMethods {
    [DllImport("user32.dll")]
    public static extern int SetWindowCompositionAttribute(IntPtr hwnd, ref WINDOWCOMPOSITIONATTRIBDATA data);
  }

  [StructLayout(LayoutKind.Sequential)]
  public struct ACCENT_POLICY {
    public int AccentState;
    public int AccentFlags;
    public int GradientColor;
    public int AnimationId;
  }

  [StructLayout(LayoutKind.Sequential)]
  public struct WINDOWCOMPOSITIONATTRIBDATA {
    public int Attribute;
    public IntPtr Data;
    public int SizeOfData;
  }

  public enum AccentState {
    ACCENT_DISABLED = 0,
    ACCENT_ENABLE_GRADIENT = 1,
    ACCENT_ENABLE_TRANSPARENTGRADIENT = 2,
    ACCENT_ENABLE_BLURBEHIND = 3,
    ACCENT_ENABLE_ACRYLICBLURBEHIND = 4
  }

  public enum WindowCompositionAttribute {
    WCA_ACCENT_POLICY = 19
  }

  public static class DwmApi {
    [DllImport("dwmapi.dll")]
    public static extern int DwmSetWindowAttribute(IntPtr hwnd, int attr, ref int value, int size);
  }
}
"@
Add-Type -TypeDefinition $nativeCode -Language CSharp

function Enable-BackdropEffect {
    param([
        ValidateSet('Mica','Acrylic')
        ][string]$Mode = 'Mica',
        [byte]$Opacity = 0x66  # 0x00-0xFF: transparencia do Acrylic
    )
    try {
        $hwnd = (New-Object System.Windows.Interop.WindowInteropHelper($script:Window)).Handle

        # Tentar modo escuro (Win10/11): DWMWA_USE_IMMERSIVE_DARK_MODE (19/20)
        $dark = 1
        try { [Win32.DwmApi]::DwmSetWindowAttribute($hwnd, 20, [ref]$dark, 4) | Out-Null } catch { try { [Win32.DwmApi]::DwmSetWindowAttribute($hwnd, 19, [ref]$dark, 4) | Out-Null } catch {} }

        if ($Mode -eq 'Mica') {
            # Win11: DWMWA_SYSTEMBACKDROP (38) = DWMSBT_MAINWINDOW (2)
            $attrBackdrop = 38
            $backdropVal = 2
            $hr = [Win32.DwmApi]::DwmSetWindowAttribute($hwnd, $attrBackdrop, [ref]$backdropVal, 4)
            if ($hr -eq 0) {
                Write-LogUI 'Mica aplicado ao fundo.' 'SUCCESS'
                return
            } else {
                Write-LogUI 'Mica indisponivel, aplicando Acrylic...' 'WARN'
            }
        }

        # Fallback/alternativa: Acrylic via SetWindowCompositionAttribute (Win10 1803+)
        $accent = New-Object Win32.ACCENT_POLICY
        $accent.AccentState = [int][Win32.AccentState]::ACCENT_ENABLE_ACRYLICBLURBEHIND
        $accent.AccentFlags = 2  # Habilita bordas/arraste
        # Cor de base (ARGB em formato ABGR): leve vidro escuro
        $r = 0x11; $g = 0x11; $b = 0x11
        $accent.GradientColor = ($Opacity -shl 24) -bor ($b -shl 16) -bor ($g -shl 8) -bor $r
        $accent.AnimationId = 0

        $size = [System.Runtime.InteropServices.Marshal]::SizeOf([type][Win32.ACCENT_POLICY])
        $ptr = [System.Runtime.InteropServices.Marshal]::AllocHGlobal($size)
        [System.Runtime.InteropServices.Marshal]::StructureToPtr($accent, $ptr, $false)
        $data = New-Object Win32.WINDOWCOMPOSITIONATTRIBDATA
        $data.Attribute = [int][Win32.WindowCompositionAttribute]::WCA_ACCENT_POLICY
        $data.SizeOfData = $size
        $data.Data = $ptr
        [Win32.NativeMethods]::SetWindowCompositionAttribute($hwnd, [ref]$data) | Out-Null
        [System.Runtime.InteropServices.Marshal]::FreeHGlobal($ptr)
        Write-LogUI 'Acrylic aplicado ao fundo.' 'SUCCESS'
    } catch {
        Write-LogUI "Falha ao aplicar efeito de transparencia: $($_.Exception.Message)" 'WARN'
    }
}
#endregion Backdrop (Mica/Acrylic) Win11

$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Win11God" Height="600" Width="900"
        WindowStartupLocation="CenterScreen" ResizeMode="CanResize"
        Background="#000000" Foreground="#F3F3F3"
        WindowStyle="None" AllowsTransparency="True"
        BorderBrush="#2B2B2B" BorderThickness="1"
        x:Name="MainWindow">
    <Window.Resources>
        <SolidColorBrush x:Key="Accent" Color="#3B82F6"/>
        <SolidColorBrush x:Key="Surface" Color="#111111"/>
        <SolidColorBrush x:Key="SurfaceAlt" Color="#1A1A1A"/>
        <SolidColorBrush x:Key="Border" Color="#2A2A2A"/>
        <SolidColorBrush x:Key="TextBrush" Color="#ECECEC"/>

        <Style TargetType="TextBlock">
            <Setter Property="Foreground" Value="{StaticResource TextBrush}"/>
        </Style>

        <Style TargetType="Button">
            <Setter Property="Margin" Value="6"/>
            <Setter Property="Padding" Value="12,8"/>
            <Setter Property="Foreground" Value="{StaticResource TextBrush}"/>
            <Setter Property="Background" Value="{StaticResource SurfaceAlt}"/>
            <Setter Property="BorderBrush" Value="{StaticResource Border}"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border x:Name="bd" Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="1" CornerRadius="8" Padding="{TemplateBinding Padding}">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="bd" Property="Background" Value="#232323"/>
                                <Setter Property="Cursor" Value="Hand"/>
                            </Trigger>
                            <Trigger Property="IsPressed" Value="True">
                                <Setter TargetName="bd" Property="Background" Value="#1C1C1C"/>
                            </Trigger>
                            <Trigger Property="IsEnabled" Value="False">
                                <Setter Property="Opacity" Value="0.6"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <Style x:Key="PrimaryButton" TargetType="Button" BasedOn="{StaticResource {x:Type Button}}">
            <Setter Property="Background" Value="{StaticResource Accent}"/>
            <Setter Property="BorderBrush" Value="#2B5FD6"/>
        </Style>

        <!-- ToggleSwitch Style applied to all CheckBox with smooth animation -->
        <Style TargetType="CheckBox">
            <Setter Property="Margin" Value="6,6"/>
            <Setter Property="Foreground" Value="{StaticResource TextBrush}"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="FocusVisualStyle" Value="{x:Null}"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="CheckBox">
                        <Grid>
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition/>
                                <ColumnDefinition Width="Auto"/>
                            </Grid.ColumnDefinitions>

                            <!-- Label -->
                            <ContentPresenter Grid.Column="0" VerticalAlignment="Center" Margin="0,0,10,0"/>

                            <!-- Toggle switch -->
                            <Grid Grid.Column="1" Width="44" Height="24">
                                <Border x:Name="SwitchTrack" BorderBrush="#2A2A2A" BorderThickness="1" CornerRadius="12">
                                    <Border.Background>
                                        <SolidColorBrush x:Name="TrackBrush" Color="#2A2A2A"/>
                                    </Border.Background>
                                </Border>
                                <Ellipse x:Name="SwitchThumb" Width="18" Height="18" Fill="#FFFFFF" VerticalAlignment="Center" HorizontalAlignment="Left" Margin="3">
                                    <Ellipse.RenderTransform>
                                        <TranslateTransform x:Name="ThumbTransform" X="0"/>
                                    </Ellipse.RenderTransform>
                                </Ellipse>
                            </Grid>
                        </Grid>

                        <!-- Triggers and smooth animations -->
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="SwitchTrack" Property="BorderBrush" Value="#3A3A3A"/>
                            </Trigger>
                            <Trigger Property="IsChecked" Value="True">
                                <Setter TargetName="SwitchTrack" Property="BorderBrush" Value="#2B5FD6"/>
                            </Trigger>
                            <Trigger Property="IsEnabled" Value="False">
                                <Setter Property="Opacity" Value="0.6"/>
                            </Trigger>
                            
                            <EventTrigger RoutedEvent="CheckBox.Checked">
                                <BeginStoryboard>
                                    <Storyboard>
                                        <DoubleAnimation Storyboard.TargetName="ThumbTransform" Storyboard.TargetProperty="X" To="20" Duration="0:0:0.15">
                                            <DoubleAnimation.EasingFunction>
                                                <QuadraticEase EasingMode="EaseOut"/>
                                            </DoubleAnimation.EasingFunction>
                                        </DoubleAnimation>
                                        <ColorAnimation Storyboard.TargetName="TrackBrush" Storyboard.TargetProperty="Color" To="#3B82F6" Duration="0:0:0.15"/>
                                    </Storyboard>
                                </BeginStoryboard>
                            </EventTrigger>
                            <EventTrigger RoutedEvent="CheckBox.Unchecked">
                                <BeginStoryboard>
                                    <Storyboard>
                                        <DoubleAnimation Storyboard.TargetName="ThumbTransform" Storyboard.TargetProperty="X" To="0" Duration="0:0:0.15">
                                            <DoubleAnimation.EasingFunction>
                                                <QuadraticEase EasingMode="EaseOut"/>
                                            </DoubleAnimation.EasingFunction>
                                        </DoubleAnimation>
                                        <ColorAnimation Storyboard.TargetName="TrackBrush" Storyboard.TargetProperty="Color" To="#2A2A2A" Duration="0:0:0.15"/>
                                    </Storyboard>
                                </BeginStoryboard>
                            </EventTrigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <Style TargetType="GroupBox">
            <Setter Property="Foreground" Value="{StaticResource TextBrush}"/>
            <Setter Property="BorderBrush" Value="Transparent"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="Background" Value="{StaticResource Surface}"/>
            <Setter Property="Margin" Value="6"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="GroupBox">
                        <Grid>
                            <Grid.RowDefinitions>
                                <RowDefinition Height="Auto"/>
                                <RowDefinition Height="*"/>
                            </Grid.RowDefinitions>
                            <ContentPresenter Grid.Row="0" ContentSource="Header" Margin="4,0,0,4"/>
                            <Border Grid.Row="1" Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" CornerRadius="8" Padding="8">
                                <ContentPresenter/>
                            </Border>
                        </Grid>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <Style TargetType="TabControl">
            <Setter Property="Background" Value="{StaticResource Surface}"/>
        </Style>
        <Style TargetType="TabItem">
            <Setter Property="Foreground" Value="{StaticResource TextBrush}"/>
            <Setter Property="Background" Value="{StaticResource Surface}"/>
            <Setter Property="BorderBrush" Value="{StaticResource Border}"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="TabItem">
                        <Grid>
                            <Border x:Name="bd" Background="{StaticResource Surface}" BorderBrush="{StaticResource Border}" BorderThickness="0,0,0,2" Padding="12,8">
                                <ContentPresenter ContentSource="Header" TextBlock.Foreground="{StaticResource TextBrush}"/>
                            </Border>
                        </Grid>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsSelected" Value="True">
                                <Setter TargetName="bd" Property="Background" Value="#1E3A5F"/>
                                <Setter TargetName="bd" Property="BorderBrush" Value="#3B82F6"/>
                                <Setter TargetName="bd" Property="BorderThickness" Value="0,0,0,3"/>
                            </Trigger>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="bd" Property="Background" Value="#1A1A2E"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <!-- Custom Window Control Button Style -->
        <Style x:Key="WindowControlButton" TargetType="Button">
            <Setter Property="Width" Value="46"/>
            <Setter Property="Height" Value="32"/>
            <Setter Property="Background" Value="Transparent"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="Foreground" Value="#FFFFFF"/>
            <Setter Property="FontFamily" Value="Segoe MDL2 Assets"/>
            <Setter Property="FontSize" Value="10"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border x:Name="bd" Background="{TemplateBinding Background}">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="bd" Property="Background" Value="#1A1A1A"/>
                            </Trigger>
                            <Trigger Property="IsPressed" Value="True">
                                <Setter TargetName="bd" Property="Background" Value="#2A2A2A"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <!-- Close Button Style -->
        <Style x:Key="CloseButton" TargetType="Button" BasedOn="{StaticResource WindowControlButton}">
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border x:Name="bd" Background="{TemplateBinding Background}">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="bd" Property="Background" Value="#E81123"/>
                            </Trigger>
                            <Trigger Property="IsPressed" Value="True">
                                <Setter TargetName="bd" Property="Background" Value="#C50E1F"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
        <!-- Scrollbar moderna: fina, arredondada, com estados em tema escuro -->
        <SolidColorBrush x:Key="ScrollBarTrackBrush" Color="#242424"/>
        <SolidColorBrush x:Key="ScrollBarTrackHoverBrush" Color="#2B2B2B"/>
        <SolidColorBrush x:Key="ScrollBarThumbBrush" Color="#5A5A5A"/>
        <SolidColorBrush x:Key="ScrollBarThumbHoverBrush" Color="#6A6A6A"/>
        <SolidColorBrush x:Key="ScrollBarThumbActiveBrush" Color="#3B82F6"/>

        <!-- Icones para listas: usa Segoe Fluent Icons com fallback para MDL2 -->
        <Style x:Key="ListIcon" TargetType="TextBlock">
            <Setter Property="FontFamily" Value="Segoe Fluent Icons, Segoe MDL2 Assets"/>
            <Setter Property="FontSize" Value="16"/>
            <Setter Property="Foreground" Value="{StaticResource TextBrush}"/>
            <Setter Property="VerticalAlignment" Value="Center"/>
            <Setter Property="Margin" Value="0,0,8,0"/>
        </Style>

        <!-- Botoes do Track invisiveis para look minimalista -->
        <Style x:Key="InvisibleRepeatButton" TargetType="RepeatButton">
            <Setter Property="Focusable" Value="False"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="RepeatButton">
                        <Grid Background="Transparent"/>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <!-- Thumb estilizado -->
        <Style x:Key="ModernScrollThumb" TargetType="Thumb">
            <Setter Property="Background" Value="{StaticResource ScrollBarThumbBrush}"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Thumb">
                        <Border x:Name="ThumbBorder" Background="{TemplateBinding Background}" CornerRadius="4"/>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <!-- ScrollBar global com templates para Vertical e Horizontal -->
        <Style TargetType="ScrollBar">
            <Setter Property="Foreground" Value="{StaticResource ScrollBarThumbBrush}"/>
            <Setter Property="Background" Value="{StaticResource ScrollBarTrackBrush}"/>
            <Setter Property="Padding" Value="0"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="Cursor" Value="Arrow"/>
            <Style.Triggers>
                <!-- Vertical -->
                <Trigger Property="Orientation" Value="Vertical">
                    <Setter Property="Width" Value="8"/>
                    <Setter Property="Template">
                        <Setter.Value>
                            <ControlTemplate TargetType="ScrollBar">
                                <Grid Width="8" Background="{TemplateBinding Background}">
                                    <Border x:Name="TrackBg" CornerRadius="4" Background="{TemplateBinding Background}"/>
                                    <Track x:Name="PART_Track" IsDirectionReversed="True" Margin="0">
                                        <Track.DecreaseRepeatButton>
                                            <RepeatButton Command="{x:Static ScrollBar.LineUpCommand}" Style="{StaticResource InvisibleRepeatButton}"/>
                                        </Track.DecreaseRepeatButton>
                                        <Track.IncreaseRepeatButton>
                                            <RepeatButton Command="{x:Static ScrollBar.LineDownCommand}" Style="{StaticResource InvisibleRepeatButton}"/>
                                        </Track.IncreaseRepeatButton>
                                        <Track.Thumb>
                                            <Thumb x:Name="Thumb" Margin="1" Style="{StaticResource ModernScrollThumb}"/>
                                        </Track.Thumb>
                                    </Track>
                                </Grid>
                                <ControlTemplate.Triggers>
                                    <Trigger Property="IsMouseOver" Value="True">
                                        <Setter TargetName="TrackBg" Property="Background" Value="{StaticResource ScrollBarTrackHoverBrush}"/>
                                        <Setter TargetName="Thumb" Property="Background" Value="{StaticResource ScrollBarThumbHoverBrush}"/>
                                    </Trigger>
                                    <Trigger SourceName="Thumb" Property="IsMouseCaptured" Value="True">
                                        <Setter TargetName="Thumb" Property="Background" Value="{StaticResource ScrollBarThumbActiveBrush}"/>
                                    </Trigger>
                                    <Trigger Property="IsEnabled" Value="False">
                                        <Setter TargetName="Thumb" Property="Opacity" Value="0.5"/>
                                    </Trigger>
                                </ControlTemplate.Triggers>
                            </ControlTemplate>
                        </Setter.Value>
                    </Setter>
                </Trigger>

                <!-- Horizontal -->
                <Trigger Property="Orientation" Value="Horizontal">
                    <Setter Property="Height" Value="8"/>
                    <Setter Property="Template">
                        <Setter.Value>
                            <ControlTemplate TargetType="ScrollBar">
                                <Grid Height="8" Background="{TemplateBinding Background}">
                                    <Border x:Name="TrackBg" CornerRadius="4" Background="{TemplateBinding Background}"/>
                                    <Track x:Name="PART_Track" IsDirectionReversed="False" Margin="0">
                                        <Track.DecreaseRepeatButton>
                                            <RepeatButton Command="{x:Static ScrollBar.LineLeftCommand}" Style="{StaticResource InvisibleRepeatButton}"/>
                                        </Track.DecreaseRepeatButton>
                                        <Track.IncreaseRepeatButton>
                                            <RepeatButton Command="{x:Static ScrollBar.LineRightCommand}" Style="{StaticResource InvisibleRepeatButton}"/>
                                        </Track.IncreaseRepeatButton>
                                        <Track.Thumb>
                                            <Thumb x:Name="Thumb" Margin="1" Style="{StaticResource ModernScrollThumb}"/>
                                        </Track.Thumb>
                                    </Track>
                                </Grid>
                                <ControlTemplate.Triggers>
                                    <Trigger Property="IsMouseOver" Value="True">
                                        <Setter TargetName="TrackBg" Property="Background" Value="{StaticResource ScrollBarTrackHoverBrush}"/>
                                        <Setter TargetName="Thumb" Property="Background" Value="{StaticResource ScrollBarThumbHoverBrush}"/>
                                    </Trigger>
                                    <Trigger SourceName="Thumb" Property="IsMouseCaptured" Value="True">
                                        <Setter TargetName="Thumb" Property="Background" Value="{StaticResource ScrollBarThumbActiveBrush}"/>
                                    </Trigger>
                                    <Trigger Property="IsEnabled" Value="False">
                                        <Setter TargetName="Thumb" Property="Opacity" Value="0.5"/>
                                    </Trigger>
                                </ControlTemplate.Triggers>
                            </ControlTemplate>
                        </Setter.Value>
                    </Setter>
                </Trigger>
            </Style.Triggers>
        </Style>
    </Window.Resources>
    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="32"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="200"/>
        </Grid.RowDefinitions>

        <!-- Custom Title Bar -->
        <Border Grid.Row="0" x:Name="TitleBar" Background="#0F0F0F" BorderBrush="#2B2B2B" BorderThickness="0,0,0,1">
            <Grid>
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="Auto"/>
                    <ColumnDefinition Width="*"/>
                    <ColumnDefinition Width="Auto"/>
                </Grid.ColumnDefinitions>
                
                <!-- App Icon and Title -->
                <StackPanel Grid.Column="0" Orientation="Horizontal" VerticalAlignment="Center" Margin="12,0,0,0">
                    <Image x:Name="AppIcon" Width="24" Height="24" Margin="0,0,8,0"/>
                    <TextBlock Text="Win11God" FontSize="14" FontWeight="Bold" Foreground="#FFFFFF" VerticalAlignment="Center"/>
                </StackPanel>
                
                <!-- Draggable Area -->
                <Rectangle Grid.Column="1" Fill="Transparent" x:Name="DragArea"/>
                
                <!-- Window Controls -->
                <StackPanel Grid.Column="2" Orientation="Horizontal">
                    <Button x:Name="MinimizeButton" Style="{StaticResource WindowControlButton}" Content="&#xE921;" ToolTip="Minimizar"/>
                    <Button x:Name="MaximizeButton" Style="{StaticResource WindowControlButton}" Content="&#xE922;" ToolTip="Maximizar"/>
                    <Button x:Name="CloseButton" Style="{StaticResource CloseButton}" Content="&#xE8BB;" ToolTip="Fechar"/>
                </StackPanel>
            </Grid>
        </Border>

        <Border Grid.Row="1" Background="#111111" BorderBrush="#2B2B2B" BorderThickness="0,0,0,1" Padding="12">
            <DockPanel LastChildFill="False">
                <TextBlock Text="Win11God" FontSize="24" FontWeight="Bold"/>
                <TextBlock Text="  |  Otimizacoes para Windows" Foreground="#BBBBBB"/>
                <StackPanel Orientation="Horizontal" DockPanel.Dock="Right">
                    <Button x:Name="btnRelaunchAdmin" Content="Reabrir como Admin"/>
                    <Button x:Name="btnSaveLog" Content="Salvar Log"/>
                </StackPanel>
            </DockPanel>
        </Border>

        <Grid Grid.Row="2" Margin="8">
            <Grid.ColumnDefinitions>
                <ColumnDefinition Width="*"/>
            </Grid.ColumnDefinitions>
            <TabControl x:Name="MainTabControl">
                <TabItem x:Name="TabGeneral">
                    <ScrollViewer>
                        <StackPanel Margin="8">
                            <GroupBox x:Name="GroupCleanup">
                                <StackPanel>
                                    <CheckBox x:Name="cbCleanTemp" ToolTip="Remove arquivos temporarios das pastas Temp">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE75C;"/>
                                            <TextBlock x:Name="txtDeleteTempFiles" Text="Apagar arquivos temporarios"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbEmptyRecycle" ToolTip="Esvazia a Lixeira para liberar espaco">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE74D;"/>
                                            <TextBlock x:Name="txtEmptyRecycleBin" Text="Esvaziar a Lixeira"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbClearUpdate" ToolTip="Apaga cache de atualizacoes baixadas do Windows Update">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE72C;"/>
                                            <TextBlock x:Name="txtClearUpdateCache" Text="Limpar cache do Windows Update"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbFlushDNS" ToolTip="Limpa a tabela de DNS para resolver nomes novamente">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE704;"/>
                                            <TextBlock x:Name="txtFlushDNS" Text="Limpar cache de DNS"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbClearStore" ToolTip="Reseta cache da Microsoft Store">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE719;"/>
                                            <TextBlock x:Name="txtClearStoreCache" Text="Limpar cache da Microsoft Store"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbClearRecent" ToolTip="Apaga a lista de arquivos recentes (Jump Lists)">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE81C;"/>
                                            <TextBlock x:Name="txtClearRecentFiles" Text="Apagar 'Arquivos Recentes'"/>
                                        </StackPanel>
                                    </CheckBox>
                                </StackPanel>
                            </GroupBox>
                            <GroupBox x:Name="GroupSystem">
                                <StackPanel>
                                    <CheckBox x:Name="cbDisableFastStartup" ToolTip="Desativa o modo de Inicializacao Rapida do Windows">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE7E8;"/>
                                            <TextBlock x:Name="txtDisableFastStartup" Text="Desativar Inicializacao Rapida"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbDisableTelemetry" ToolTip="Reduz coleta de dados e telemetria ao minimo">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE713;"/>
                                            <TextBlock x:Name="txtDisableTelemetry" Text="Reduzir telemetria (privacidade)"/>
                                        </StackPanel>
                                    </CheckBox>
                                </StackPanel>
                            </GroupBox>
                            <GroupBox x:Name="GroupRestorePoint">
                                <StackPanel>
                                    <CheckBox x:Name="cbRestorePoint" ToolTip="Cria um ponto de restauracao antes de aplicar alteracoes" IsChecked="True">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE823;"/>
                                            <TextBlock x:Name="txtCreateRestorePoint" Text="Criar ponto de restauracao antes de aplicar"/>
                                        </StackPanel>
                                    </CheckBox>
                                </StackPanel>
                            </GroupBox>

                            <!-- Experiencia e Desempenho (Windows 11) -->
                            <GroupBox x:Name="GroupPerformance">
                                <StackPanel>
                                    <CheckBox x:Name="cbDisableGameBar" ToolTip="Desativa Game Bar e gravacao DVR">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE7FC;"/>
                                            <TextBlock x:Name="txtDisableGameBar" Text="Desativar Game Bar/DVR"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbDisableAnimations" ToolTip="Reduz animacoes da interface para melhor desempenho">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE95A;"/>
                                            <TextBlock x:Name="txtDisableAnimations" Text="Reduzir animacoes da interface"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbEnableStorageSense" ToolTip="Ativa Storage Sense para limpeza automatica de arquivos temporarios">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE7B9;"/>
                                            <TextBlock x:Name="txtEnableStorageSense" Text="Ativar Storage Sense (limpeza automatica)"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbDisableSuggestions" ToolTip="Remove dicas e sugestoes no sistema e Menu Iniciar">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE8E5;"/>
                                            <TextBlock x:Name="txtDisableSuggestions" Text="Desativar sugestoes e dicas"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbDisableWidgets" ToolTip="Oculta Widgets da barra de tarefas (Windows 11)">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE12B;"/>
                                            <TextBlock x:Name="txtDisableWidgets" Text="Desativar Widgets"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbDisableBackgroundApps" ToolTip="Impede apps de rodarem em segundo plano">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE708;"/>
                                            <TextBlock x:Name="txtDisableBackgroundApps" Text="Desativar apps em segundo plano"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbDisableCopilot" ToolTip="Oculta/Desativa Copilot (Windows 11 23H2+)">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE7C0;"/>
                                            <TextBlock x:Name="txtDisableCopilot" Text="Desativar Copilot"/>
                                        </StackPanel>
                                    </CheckBox>
                                </StackPanel>
                            </GroupBox>

                            <!-- Botoes de Acao -->
                            <StackPanel Orientation="Horizontal" HorizontalAlignment="Center" Margin="0,16,0,0">
                                <Button x:Name="btnSelectAllGeral" Content="Selecionar Tudo" Width="120"/>
                                <Button x:Name="btnApplyGeral" Content="Aplicar" Style="{StaticResource PrimaryButton}" Width="120" Margin="8,0"/>
                                <Button x:Name="btnSimulateGeral" Content="Simular" Width="120"/>
                                <Button x:Name="btnClearAllGeral" Content="Limpar Tudo" Width="120"/>
                            </StackPanel>
                        </StackPanel>
                    </ScrollViewer>
                </TabItem>
                <TabItem x:Name="TabRevert">
                    <ScrollViewer VerticalScrollBarVisibility="Auto">
                        <Border Margin="8" Background="#141414" CornerRadius="10" BorderThickness="0">
                            <Border.Effect>
                                <DropShadowEffect Color="#FF6B6B" BlurRadius="12" ShadowDepth="0" Opacity="0.25"/>
                            </Border.Effect>
                            <StackPanel Margin="16">
                                <!-- Cabeçalho da Seção -->
                                <StackPanel Orientation="Horizontal" Margin="0,0,0,16">
                                    <TextBlock FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" Text="&#xE777;" Foreground="#FF6B6B" FontSize="20" Margin="0,0,8,0"/>
                                    <TextBlock x:Name="txtRevertActions" Text="Acoes de Reversao" FontSize="18" FontWeight="Bold" Foreground="#FF6B6B"/>
                                </StackPanel>
                                
                                <!-- Aviso Importante -->
                                <Border Background="#2D1B1B" BorderBrush="#FF6B6B" BorderThickness="1" CornerRadius="8" Margin="0,0,0,16" Padding="12">
                                    <StackPanel Orientation="Horizontal">
                                        <TextBlock FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" Text="&#xE7BA;" Foreground="#FFD700" FontSize="16" Margin="0,0,8,0"/>
                                        <TextBlock x:Name="txtRevertWarning" Text="Atencao: Estas acoes revertem otimizacoes aplicadas anteriormente. Use com cuidado." 
                                                   Foreground="#FFD700" TextWrapping="Wrap" FontSize="12"/>
                                    </StackPanel>
                                </Border>

                                <!-- Seção de Reversão do Sistema -->
                                <GroupBox Foreground="#FF6B6B" BorderThickness="0" Background="Transparent" Margin="0,0,0,16">
                                    <GroupBox.Header>
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" Text="&#xE7F4;" Foreground="#FF6B6B" Margin="0,0,5,0"/>
                                            <TextBlock x:Name="txtSystemSettings" Text="Configuracoes do Sistema" FontWeight="SemiBold"/>
                                        </StackPanel>
                                    </GroupBox.Header>
                                    <StackPanel>
                                        <Button x:Name="btnRevertFastStartup" Margin="0,4" Height="40" HorizontalAlignment="Stretch">
                                            <StackPanel Orientation="Horizontal">
                                                <TextBlock FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" Text="&#xE7E8;" Foreground="#FF6B6B" Margin="0,0,8,0"/>
                                                <TextBlock x:Name="txtReactivateFastStartup" Text="Reativar Inicializacao Rapida" VerticalAlignment="Center"/>
                                            </StackPanel>
                                        </Button>
                                        
                                        <Button x:Name="btnRevertTelemetry" Margin="0,4" Height="40" HorizontalAlignment="Stretch">
                                            <StackPanel Orientation="Horizontal">
                                                <TextBlock FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" Text="&#xE909;" Foreground="#FF6B6B" Margin="0,0,8,0"/>
                                                <TextBlock x:Name="txtRevertTelemetrySettings" Text="Reverter Configuracoes de Telemetria" VerticalAlignment="Center"/>
                                            </StackPanel>
                                        </Button>
                                        
                                        <Button x:Name="btnRevertServices" Margin="0,4" Height="40" HorizontalAlignment="Stretch">
                                            <StackPanel Orientation="Horizontal">
                                                <TextBlock FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" Text="&#xE8B7;" Foreground="#FF6B6B" Margin="0,0,8,0"/>
                                                <TextBlock x:Name="txtRestoreDisabledServices" Text="Restaurar Serviços Desabilitados" VerticalAlignment="Center"/>
                                            </StackPanel>
                                        </Button>
                                    </StackPanel>
                                </GroupBox>

                                <!-- Seção de Reversão de Interface -->
                                <GroupBox Foreground="#FF6B6B" BorderThickness="0" Background="Transparent" Margin="0,0,0,16">
                                    <GroupBox.Header>
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" Text="&#xE771;" Foreground="#FF6B6B" Margin="0,0,5,0"/>
                                            <TextBlock x:Name="txtInterfaceAppearance" Text="Interface e Aparencia" FontWeight="SemiBold"/>
                                        </StackPanel>
                                    </GroupBox.Header>
                                    <StackPanel>
                                        <Button x:Name="btnRevertTaskbar" Margin="0,4" Height="40" HorizontalAlignment="Stretch">
                                            <StackPanel Orientation="Horizontal">
                                                <TextBlock FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" Text="&#xE7C4;" Foreground="#FF6B6B" Margin="0,0,8,0"/>
                                                <TextBlock x:Name="txtRestoreDefaultTaskbar" Text="Restaurar Barra de Tarefas Padrao" VerticalAlignment="Center"/>
                                            </StackPanel>
                                        </Button>
                                        
                                        <Button x:Name="btnRevertStartMenu" Margin="0,4" Height="40" HorizontalAlignment="Stretch">
                                            <StackPanel Orientation="Horizontal">
                                                <TextBlock FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" Text="&#xE700;" Foreground="#FF6B6B" Margin="0,0,8,0"/>
                                                <TextBlock x:Name="txtRestoreOriginalStartMenu" Text="Restaurar Menu Iniciar Original" VerticalAlignment="Center"/>
                                            </StackPanel>
                                        </Button>
                                        
                                        <Button x:Name="btnRevertContextMenu" Margin="0,4" Height="40" HorizontalAlignment="Stretch">
                                            <StackPanel Orientation="Horizontal">
                                                <TextBlock FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" Text="&#xE712;" Foreground="#FF6B6B" Margin="0,0,8,0"/>
                                                <TextBlock x:Name="txtRestoreWin11ContextMenu" Text="Restaurar Menu de Contexto Win11" VerticalAlignment="Center"/>
                                            </StackPanel>
                                        </Button>
                                    </StackPanel>
                                </GroupBox>

                                <!-- Seção de Reversão Completa -->
                                <GroupBox Foreground="#FF4444" BorderThickness="0" Background="Transparent">
                                    <GroupBox.Header>
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" Text="&#xE7BA;" Foreground="#FF4444" Margin="0,0,5,0"/>
                                            <TextBlock x:Name="txtCompleteReversion" Text="Reversao Completa" FontWeight="SemiBold"/>
                                        </StackPanel>
                                    </GroupBox.Header>
                                    <StackPanel>
                                        <Button x:Name="btnRevertAll" Margin="0,4" Height="50" HorizontalAlignment="Stretch" 
                                                Background="#2D1B1B" BorderBrush="#FF4444" BorderThickness="2">
                                            <StackPanel Orientation="Horizontal">
                                                <TextBlock FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" Text="&#xE777;" Foreground="#FF4444" FontSize="16" Margin="0,0,8,0"/>
                                                <StackPanel>
                                                    <TextBlock x:Name="txtRevertAllOptimizations" Text="Reverter Todas as Otimizacoes" FontWeight="Bold" Foreground="#FF4444"/>
                                                    <TextBlock x:Name="txtRestoreSystemOriginalState" Text="Restaura o sistema ao estado original" FontSize="10" Foreground="#CCCCCC"/>
                                                </StackPanel>
                                            </StackPanel>
                                        </Button>
                                    </StackPanel>
                                </GroupBox>
                            </StackPanel>
                        </Border>
                    </ScrollViewer>
                </TabItem>
                <TabItem x:Name="TabDebloat">
                    <ScrollViewer VerticalScrollBarVisibility="Auto">
                        <Border Margin="8" Background="#141414" CornerRadius="10" BorderThickness="0">
                            <Border.Effect>
                                <DropShadowEffect Color="#3B82F6" BlurRadius="12" ShadowDepth="0" Opacity="0.25"/>
                            </Border.Effect>
                            <StackPanel>
                            <!-- Apps Recomendados Manter (Azul) -->
                            <GroupBox Foreground="#3B82F6" BorderThickness="0" Background="Transparent">
                                <GroupBox.Header>
                                    <StackPanel Orientation="Horizontal">
                                        <TextBlock FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" Text="&#xE73E;" Foreground="#3B82F6" Margin="0,0,5,0"/>
                                        <TextBlock x:Name="txtAppsKeep" Text="Apps Recomendados Manter"/>
                                    </StackPanel>
                                </GroupBox.Header>
                                <StackPanel>
                                    <CheckBox x:Name="cbKeepCalculator" ToolTip="Calculadora do Windows - util para calculos basicos">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE8EF;" Foreground="#3B82F6"/>
                                            <TextBlock x:Name="txtCalculator" Text="Calculadora"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbKeepStore" ToolTip="Microsoft Store - necessaria para instalar apps">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE719;" Foreground="#3B82F6"/>
                                            <TextBlock x:Name="txtMicrosoftStore" Text="Microsoft Store"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbKeepPhotos" ToolTip="Fotos - visualizador de imagens padrao">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE91B;" Foreground="#3B82F6"/>
                                            <TextBlock x:Name="txtPhotos" Text="Fotos"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbKeepNotepad" ToolTip="Bloco de Notas - editor de texto basico">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE70F;" Foreground="#3B82F6"/>
                                            <TextBlock x:Name="txtNotepad" Text="Bloco de Notas"/>
                                        </StackPanel>
                                    </CheckBox>
                                </StackPanel>
                            </GroupBox>

                            <!-- Apps Recomendados Remover (Vermelho) -->
                            <GroupBox Foreground="#EF4444" BorderThickness="0" Background="Transparent">
                                <GroupBox.Header>
                                    <StackPanel Orientation="Horizontal">
                                        <TextBlock FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" Text="&#xE711;" Foreground="#EF4444" Margin="0,0,5,0"/>
                                        <TextBlock x:Name="txtAppsRemove" Text="Apps Recomendados Remover"/>
                                    </StackPanel>
                                </GroupBox.Header>
                                <StackPanel>
                                    <CheckBox x:Name="cbRemoveCandyCrush" ToolTip="Candy Crush Saga - jogo pre-instalado">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE7FC;" Foreground="#EF4444"/>
                                            <TextBlock x:Name="txtCandyCrush" Text="Candy Crush Saga"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbRemoveXbox" ToolTip="Xbox - apps de jogos (se nao usa jogos)">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE990;" Foreground="#EF4444"/>
                                            <TextBlock x:Name="txtXbox" Text="Xbox (Game Bar, Identity Provider)"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbRemoveSkype" ToolTip="Skype - comunicacao (se nao usa)">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE717;" Foreground="#EF4444"/>
                                            <TextBlock x:Name="txtSkype" Text="Skype"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbRemoveZuneMusic" ToolTip="Groove Music - player de musica">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE8D6;" Foreground="#EF4444"/>
                                            <TextBlock x:Name="txtGrooveMusic" Text="Groove Music"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbRemoveZuneVideo" ToolTip="Filmes e TV - player de video">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE714;" Foreground="#EF4444"/>
                                            <TextBlock x:Name="txtMoviesTV" Text="Filmes e TV"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbRemoveBingNews" ToolTip="Microsoft News - app de noticias">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE789;" Foreground="#EF4444"/>
                                            <TextBlock x:Name="txtMicrosoftNews" Text="Microsoft News"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbRemoveWeather" ToolTip="Clima - app de previsao do tempo">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE753;" Foreground="#EF4444"/>
                                            <TextBlock x:Name="txtWeather" Text="Clima"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbRemoveMaps" ToolTip="Mapas - app de navegacao">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE707;" Foreground="#EF4444"/>
                                            <TextBlock x:Name="txtMaps" Text="Mapas"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbRemove3DViewer" ToolTip="Visualizador 3D - visualizador de modelos 3D">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xF158;" Foreground="#EF4444"/>
                                            <TextBlock x:Name="txt3DViewer" Text="Visualizador 3D"/>
                                        </StackPanel>
                                    </CheckBox>
                                </StackPanel>
                            </GroupBox>

                            <!-- Servicos Pesados (Avancado) -->
                            <GroupBox Foreground="#F59E0B" BorderThickness="0" Background="Transparent">
                                <GroupBox.Header>
                                    <StackPanel Orientation="Horizontal">
                                        <TextBlock FontFamily="Segoe Fluent Icons, Segoe MDL2 Assets" Text="&#xE945;" Foreground="#F59E0B" Margin="0,0,5,0"/>
                                        <TextBlock x:Name="txtHeavyServices" Text="Servicos Pesados (Avancado)"/>
                                    </StackPanel>
                                </GroupBox.Header>
                                <StackPanel>
                                    <CheckBox x:Name="cbDisableWindowsSearch" ToolTip="Desabilita indexacao de arquivos (pode deixar busca mais lenta)">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE721;" Foreground="#F59E0B"/>
                                            <TextBlock x:Name="txtWindowsSearch" Text="Windows Search (Indexacao)"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbDisableFax" ToolTip="Servico de Fax - raramente usado">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE8A8;" Foreground="#F59E0B"/>
                                            <TextBlock x:Name="txtFaxService" Text="Servico de Fax"/>
                                        </StackPanel>
                                    </CheckBox>
                                    <CheckBox x:Name="cbDisableTabletInput" ToolTip="Servico de entrada de tablet - se nao usa touch">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock Style="{StaticResource ListIcon}" Text="&#xE70A;" Foreground="#F59E0B"/>
                                            <TextBlock x:Name="txtTabletInput" Text="Tablet PC Input Service"/>
                                        </StackPanel>
                                    </CheckBox>
                                </StackPanel>
                            </GroupBox>

                            <!-- Botoes de Acao -->
                            <StackPanel Orientation="Horizontal" HorizontalAlignment="Center" Margin="0,16,0,0">
                                <Button x:Name="btnApplyDebloat" Content="Aplicar Debloat" Style="{StaticResource PrimaryButton}" Width="140"/>
                                <Button x:Name="btnSimulateDebloat" Content="Simular" Width="120" Margin="8,0"/>
                                <Button x:Name="btnSelectAllDebloat" Content="Selecionar Tudo" Width="120"/>
                                <Button x:Name="btnClearAllDebloat" Content="Limpar Tudo" Width="120"/>
                            </StackPanel>
                            </StackPanel>
                        </Border>
                    </ScrollViewer>
                </TabItem>
                <TabItem x:Name="TabAbout">
                    <ScrollViewer VerticalScrollBarVisibility="Auto">
                        <Border Margin="12" Background="{StaticResource Surface}" BorderBrush="{StaticResource Border}" BorderThickness="1" CornerRadius="10" Padding="16">
                            <Grid>
                                <Grid.ColumnDefinitions>
                                    <ColumnDefinition Width="2*"/>
                                    <ColumnDefinition Width="*"/>
                                </Grid.ColumnDefinitions>

                                <!-- Info principal -->
                                <StackPanel Grid.Column="0">
                                    <StackPanel Orientation="Horizontal" VerticalAlignment="Center">
                                        <Image x:Name="AboutIcon" Width="48" Height="48" Margin="0,0,8,0"/>
                                        <TextBlock x:Name="txtAppName" Text="Win11God" FontSize="24" FontWeight="Bold" Margin="8,0,0,0"/>
                                    </StackPanel>
                                    <TextBlock x:Name="txtAppDescription" Text="UI estilo Windows 11. Execute como administrador." Margin="0,8,0,0"/>
                                    <TextBlock x:Name="txtAppInstructions" Text="Selecione as otimizacoes e clique em Aplicar." TextWrapping="Wrap" Margin="0,4,0,0"/>

                                    <Border Background="#1E3A5F" CornerRadius="6" Padding="8,6" HorizontalAlignment="Left" Margin="0,6,0,0">
                                        <TextBlock x:Name="txtLanguageInfo" Text="Linguagem: PowerShell (WPF)" Foreground="#FFFFFF"/>
                                    </Border>

                                    <Border Background="#141414" CornerRadius="8" Padding="12" Margin="0,10,0,0" BorderBrush="{StaticResource Border}" BorderThickness="1">
                                        <StackPanel>
                                            <TextBlock x:Name="txtDeveloper" Text="Desenvolvedor" FontWeight="SemiBold"/>
                                            <TextBlock Text="aMathyzin" Margin="0,6,0,0"/>
                                        </StackPanel>
                                    </Border>
                                </StackPanel>

                                <!-- Links -->
                                <StackPanel Grid.Column="1" Margin="16,0,0,0" VerticalAlignment="Top">
                                    <Button x:Name="btnSite" Style="{StaticResource PrimaryButton}" ToolTip="Abrir site oficial">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock FontFamily="Segoe MDL2 Assets" Text="&#xE774;"/>
                                            <TextBlock x:Name="txtOfficialSite" Text="Site oficial" Margin="8,0,0,0"/>
                                        </StackPanel>
                                    </Button>
                                    <Button x:Name="btnPortfolio" ToolTip="Abrir portifolio" Width="180" Margin="0,8,0,0">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock FontFamily="Segoe MDL2 Assets" Text="&#xE13D;"/>
                                            <TextBlock x:Name="txtPortfolio" Text="Portifolio" Margin="8,0,0,0"/>
                                        </StackPanel>
                                    </Button>
                                    <Button x:Name="btnYouTube" ToolTip="Abrir YouTube" Width="180" Margin="0,8,0,0">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock FontFamily="Segoe MDL2 Assets" Text="&#xE768;"/>
                                            <TextBlock x:Name="txtYouTube" Text="YouTube" Margin="8,0,0,0"/>
                                        </StackPanel>
                                    </Button>
                                    <Button x:Name="btnDiscord" ToolTip="Abrir Discord" Width="180" Margin="0,8,0,0">
                                        <StackPanel Orientation="Horizontal">
                                            <TextBlock FontFamily="Segoe MDL2 Assets" Text="&#xE8BD;"/>
                                            <TextBlock x:Name="txtDiscord" Text="Discord" Margin="8,0,0,0"/>
                                        </StackPanel>
                                    </Button>
                                </StackPanel>
                            </Grid>
                        </Border>
                    </ScrollViewer>
                </TabItem>
                <TabItem x:Name="TabPreferences">
                    <ScrollViewer VerticalScrollBarVisibility="Auto">
                        <Border Margin="12" Background="{StaticResource Surface}" BorderBrush="{StaticResource Border}" BorderThickness="1" CornerRadius="10" Padding="16">
                            <StackPanel>
                                <GroupBox x:Name="GroupLanguage" Margin="0,0,0,16">
                                    <StackPanel>
                                        <TextBlock Text="Selecione o idioma da interface:" Margin="0,0,0,8"/>
                                        <ComboBox x:Name="cbLanguage" Width="200" HorizontalAlignment="Left">
                                            <ComboBoxItem Content="Portugues" Tag="pt"/>
                                            <ComboBoxItem Content="English" Tag="en"/>
                                            <ComboBoxItem Content="Espanol" Tag="es"/>
                                        </ComboBox>
                                        <Button x:Name="btnApplyLanguage" Content="Aplicar Idioma" Width="120" HorizontalAlignment="Left" Margin="0,8,0,0" Style="{StaticResource PrimaryButton}"/>
                                    </StackPanel>
                                </GroupBox>
                            </StackPanel>
                        </Border>
                    </ScrollViewer>
                </TabItem>
            </TabControl>


        </Grid>

        <Grid Grid.Row="3">
            <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="*"/>
                <RowDefinition Height="Auto"/>
            </Grid.RowDefinitions>
            <DockPanel Margin="8">
                <TextBlock Text="Log" FontWeight="SemiBold"/>
            </DockPanel>
            <TextBox x:Name="tbLog" Grid.Row="1" Margin="8" Background="#0B0B0B" Foreground="#DADADA" BorderBrush="#2B2B2B" IsReadOnly="True" TextWrapping="Wrap" VerticalScrollBarVisibility="Auto"/>
            <ProgressBar x:Name="pb" Grid.Row="2" Margin="8" Height="10" Minimum="0" Maximum="100"/>
        </Grid>
    </Grid>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader ([xml]$xaml)
$script:Window = [Windows.Markup.XamlReader]::Load($reader)

# Function to update all translations to UI elements
function Update-Translations {
    if ($script:Window) {
        $script:Window.FindName("TabGeneral").Header = Get-Translation "General"
        $script:Window.FindName("GroupCleanup").Header = Get-Translation "Cleanup"
        $script:Window.FindName("GroupSystem").Header = Get-Translation "System"
        $script:Window.FindName("GroupRestorePoint").Header = Get-Translation "RestorePoint"
        $script:Window.FindName("GroupPerformance").Header = Get-Translation "Performance"
        $script:Window.FindName("TabRevert").Header = Get-Translation "Reverter"
        $script:Window.FindName("TabDebloat").Header = Get-Translation "Debloat"
        $script:Window.FindName("TabAbout").Header = Get-Translation "About"
        $script:Window.FindName("TabPreferences").Header = Get-Translation "Preferences"
        $script:Window.FindName("GroupLanguage").Header = Get-Translation "Language"
        
        # Cleanup group item texts
        $el = $script:Window.FindName('txtDeleteTempFiles'); if ($el) { $el.Text = Get-Translation 'DeleteTempFiles' }
        $el = $script:Window.FindName('txtEmptyRecycleBin'); if ($el) { $el.Text = Get-Translation 'EmptyRecycleBin' }
        $el = $script:Window.FindName('txtClearUpdateCache'); if ($el) { $el.Text = Get-Translation 'ClearUpdateCache' }
        $el = $script:Window.FindName('txtFlushDNS'); if ($el) { $el.Text = Get-Translation 'FlushDNS' }
        $el = $script:Window.FindName('txtClearStoreCache'); if ($el) { $el.Text = Get-Translation 'ClearStoreCache' }
        $el = $script:Window.FindName('txtClearRecentFiles'); if ($el) { $el.Text = Get-Translation 'ClearRecentFiles' }

        # System group item texts
        $el = $script:Window.FindName('txtDisableFastStartup'); if ($el) { $el.Text = Get-Translation 'DisableFastStartup' }
        $el = $script:Window.FindName('txtDisableTelemetry'); if ($el) { $el.Text = Get-Translation 'DisableTelemetry' }

        # RestorePoint group item texts
        $el = $script:Window.FindName('txtCreateRestorePoint'); if ($el) { $el.Text = Get-Translation 'CreateRestorePoint' }

        # Performance group item texts
        $el = $script:Window.FindName('txtDisableGameBar'); if ($el) { $el.Text = Get-Translation 'DisableGameBar' }
        $el = $script:Window.FindName('txtDisableAnimations'); if ($el) { $el.Text = Get-Translation 'DisableAnimations' }
        $el = $script:Window.FindName('txtEnableStorageSense'); if ($el) { $el.Text = Get-Translation 'EnableStorageSense' }
        $el = $script:Window.FindName('txtDisableSuggestions'); if ($el) { $el.Text = Get-Translation 'DisableSuggestions' }
        $el = $script:Window.FindName('txtDisableWidgets'); if ($el) { $el.Text = Get-Translation 'DisableWidgets' }
        $el = $script:Window.FindName('txtDisableBackgroundApps'); if ($el) { $el.Text = Get-Translation 'DisableBackgroundApps' }
        $el = $script:Window.FindName('txtDisableCopilot'); if ($el) { $el.Text = Get-Translation 'DisableCopilot' }

        # Revert tab texts
        $el = $script:Window.FindName('txtRevertActions'); if ($el) { $el.Text = Get-Translation 'RevertActions' }
        $el = $script:Window.FindName('txtRevertWarning'); if ($el) { $el.Text = Get-Translation 'RevertWarning' }
        $el = $script:Window.FindName('txtSystemSettings'); if ($el) { $el.Text = Get-Translation 'System' }
        $el = $script:Window.FindName('txtReactivateFastStartup'); if ($el) { $el.Text = Get-Translation 'ReactivateFastStartupBtn' }
        $el = $script:Window.FindName('txtRevertTelemetrySettings'); if ($el) { $el.Text = Get-Translation 'RevertTelemetrySettingsBtn' }
        $el = $script:Window.FindName('txtRestoreDisabledServices'); if ($el) { $el.Text = Get-Translation 'RestoreDisabledServices' }
        $el = $script:Window.FindName('txtInterfaceAppearance'); if ($el) { $el.Text = Get-Translation 'InterfaceAppearance' }
        $el = $script:Window.FindName('txtRestoreDefaultTaskbar'); if ($el) { $el.Text = Get-Translation 'RestoreDefaultTaskbar' }
        $el = $script:Window.FindName('txtRestoreOriginalStartMenu'); if ($el) { $el.Text = Get-Translation 'RestoreOriginalStartMenu' }
        $el = $script:Window.FindName('txtRestoreWin11ContextMenu'); if ($el) { $el.Text = Get-Translation 'RestoreWin11ContextMenu' }
        $el = $script:Window.FindName('txtCompleteReversion'); if ($el) { $el.Text = Get-Translation 'CompleteReversion' }
        $el = $script:Window.FindName('txtRevertAllOptimizations'); if ($el) { $el.Text = Get-Translation 'RevertAllOptimizations' }
        $el = $script:Window.FindName('txtRestoreSystemOriginalState'); if ($el) { $el.Text = Get-Translation 'RestoreSystemOriginalState' }

        # Debloat tab texts
        $el = $script:Window.FindName('txtAppsKeep'); if ($el) { $el.Text = Get-Translation 'AppsKeep' }
        $el = $script:Window.FindName('txtCalculator'); if ($el) { $el.Text = Get-Translation 'Calculator' }
        $el = $script:Window.FindName('txtMicrosoftStore'); if ($el) { $el.Text = Get-Translation 'MicrosoftStore' }
        $el = $script:Window.FindName('txtPhotos'); if ($el) { $el.Text = Get-Translation 'Photos' }
        $el = $script:Window.FindName('txtNotepad'); if ($el) { $el.Text = Get-Translation 'Notepad' }
        $el = $script:Window.FindName('txtAppsRemove'); if ($el) { $el.Text = Get-Translation 'AppsRemove' }
        $el = $script:Window.FindName('txtCandyCrush'); if ($el) { $el.Text = Get-Translation 'CandyCrush' }
        $el = $script:Window.FindName('txtXbox'); if ($el) { $el.Text = Get-Translation 'Xbox' }
        $el = $script:Window.FindName('txtSkype'); if ($el) { $el.Text = Get-Translation 'Skype' }
        $el = $script:Window.FindName('txtGrooveMusic'); if ($el) { $el.Text = Get-Translation 'GrooveMusic' }
        $el = $script:Window.FindName('txtMoviesTV'); if ($el) { $el.Text = Get-Translation 'MoviesTV' }
        $el = $script:Window.FindName('txtMicrosoftNews'); if ($el) { $el.Text = Get-Translation 'MicrosoftNews' }
        $el = $script:Window.FindName('txtWeather'); if ($el) { $el.Text = Get-Translation 'Weather' }
        $el = $script:Window.FindName('txtMaps'); if ($el) { $el.Text = Get-Translation 'Maps' }
        $el = $script:Window.FindName('txt3DViewer'); if ($el) { $el.Text = Get-Translation '3DViewer' }
        $el = $script:Window.FindName('txtHeavyServices'); if ($el) { $el.Text = Get-Translation 'HeavyServices' }
        $el = $script:Window.FindName('txtWindowsSearch'); if ($el) { $el.Text = Get-Translation 'WindowsSearch' }
        $el = $script:Window.FindName('txtFaxService'); if ($el) { $el.Text = Get-Translation 'FaxService' }
        $el = $script:Window.FindName('txtTabletInput'); if ($el) { $el.Text = Get-Translation 'TabletInput' }

        # Debloat tab buttons
        $btn = $script:Window.FindName('btnApplyDebloat'); if ($btn) { $btn.Content = Get-Translation 'btnApplyDebloat' }
        $btn = $script:Window.FindName('btnSimulateDebloat'); if ($btn) { $btn.Content = Get-Translation 'btnSimulateDebloat' }
        $btn = $script:Window.FindName('btnSelectAllDebloat'); if ($btn) { $btn.Content = Get-Translation 'btnSelectAllDebloat' }
        $btn = $script:Window.FindName('btnClearAllDebloat'); if ($btn) { $btn.Content = Get-Translation 'btnClearAllDebloat' }

        # About tab texts
        $el = $script:Window.FindName('txtAppName'); if ($el) { $el.Text = Get-Translation 'AppName' }
        $el = $script:Window.FindName('txtAppDescription'); if ($el) { $el.Text = Get-Translation 'AppDescription' }
        $el = $script:Window.FindName('txtAppInstructions'); if ($el) { $el.Text = Get-Translation 'AppInstructions' }
        $el = $script:Window.FindName('txtLanguageInfo'); if ($el) { $el.Text = Get-Translation 'LanguageInfo' }
        $el = $script:Window.FindName('txtDeveloper'); if ($el) { $el.Text = Get-Translation 'Developer' }
        $el = $script:Window.FindName('txtOfficialSite'); if ($el) { $el.Text = Get-Translation 'OfficialSite' }
        $el = $script:Window.FindName('txtPortfolio'); if ($el) { $el.Text = Get-Translation 'Portfolio' }
        $el = $script:Window.FindName('txtYouTube'); if ($el) { $el.Text = Get-Translation 'YouTube' }
        $el = $script:Window.FindName('txtDiscord'); if ($el) { $el.Text = Get-Translation 'Discord' }

        # General tab action buttons
        $btn = $script:Window.FindName('btnSelectAllGeral'); if ($btn) { $btn.Content = Get-Translation 'SelectAll' }
        $btn = $script:Window.FindName('btnApplyGeral'); if ($btn) { $btn.Content = Get-Translation 'Apply' }
        $btn = $script:Window.FindName('btnSimulateGeral'); if ($btn) { $btn.Content = Get-Translation 'Simulate' }
        $btn = $script:Window.FindName('btnClearAllGeral'); if ($btn) { $btn.Content = Get-Translation 'ClearAll' }

        # Update ComboBox selection after language change
        $cbLanguage = $script:Window.FindName("cbLanguage")
        if ($cbLanguage) {
            switch ($script:CurrentLanguage) {
                'pt' { $cbLanguage.SelectedIndex = 0 }
                'en' { $cbLanguage.SelectedIndex = 1 }
                'es' { $cbLanguage.SelectedIndex = 2 }
            }
        }
    }
}

# Setup application icon
try {
    # Baixar icone ICO para a janela
    $iconPath = Get-AppIcon
    
    # Baixar icone PNG para titlebar e aba sobre
    $iconPngPath = Get-AppIconPNG
    
    # Configurar icone da janela (apenas .ico)
    if ($iconPath -and (Test-Path $iconPath)) {
        $Window.Icon = $iconPath
        Write-LogUI "Icone da janela carregado: $iconPath" 'INFO'
    }
    
    # Configurar icones da titlebar e aba sobre (apenas .png)
    if ($iconPngPath -and (Test-Path $iconPngPath)) {
        # Set title bar icon
        $AppIcon = $Window.FindName('AppIcon')
        if ($AppIcon) {
            $AppIcon.Source = $iconPngPath
        }
        
        # Set about tab icon
        $AboutIcon = $Window.FindName('AboutIcon')
        if ($AboutIcon) {
            $AboutIcon.Source = $iconPngPath
        }
        
        Write-LogUI "Icones PNG carregados: $iconPngPath" 'INFO'
    } else {
        Write-LogUI "Nao foi possivel carregar os icones PNG" 'WARNING'
    }
} catch {
    Write-LogUI "Erro ao configurar icone: $($_.Exception.Message)" 'ERROR'
}

# Referencia ao TabControl principal para detectar a aba ativa
$MainTabControl = $Window.FindName('MainTabControl')

# Window control buttons
$MinimizeButton = $Window.FindName('MinimizeButton')
$MaximizeButton = $Window.FindName('MaximizeButton')
$CloseButton = $Window.FindName('CloseButton')
$DragArea = $Window.FindName('DragArea')

$script:LogBox = $Window.FindName('tbLog')
$ProgressBar = $Window.FindName('pb')
$btnApplyGeral = $Window.FindName('btnApplyGeral')
$btnSimulateGeral = $Window.FindName('btnSimulateGeral')
# Botão removido da interface de reversão
# $btnApplyReverter = $Window.FindName('btnApplyReverter')
$btnSelectAllGeral = $Window.FindName('btnSelectAllGeral')
$btnClearAllGeral = $Window.FindName('btnClearAllGeral')
# Botões removidos da interface de reversão
# $btnSelectAllReverter = $Window.FindName('btnSelectAllReverter')
# $btnClearAllReverter = $Window.FindName('btnClearAllReverter')
$btnRelaunchAdmin = $Window.FindName('btnRelaunchAdmin')
$btnSite = $Window.FindName('btnSite')
$btnPortfolio = $Window.FindName('btnPortfolio')
$btnYouTube = $Window.FindName('btnYouTube')
$btnDiscord = $Window.FindName('btnDiscord')
$btnSaveLog = $Window.FindName('btnSaveLog')

# Solicitar elevacao automaticamente ao iniciar (exceto em modo sem elevacao)
if (-not (Test-IsAdmin) -and -not $NoElevation) {
    Restart-Admin
} elseif ($NoElevation) {
    Write-LogUI 'Modo sem elevacao ativo: sem elevacao automatica.' 'INFO'
}

# Oculta o botao de relancamento se ja estiver como admin
if (Test-IsAdmin -and $btnRelaunchAdmin) { $btnRelaunchAdmin.Visibility = 'Collapsed' } else { if ($btnRelaunchAdmin) { $btnRelaunchAdmin.Visibility = 'Visible' } }

# Aplicar efeito de fundo assim que a janela estiver inicializada
$script:Window.Add_SourceInitialized({ Enable-BackdropEffect -Mode 'Mica' -Opacity 0x50 })

$cbCleanTemp = $Window.FindName('cbCleanTemp')
$cbEmptyRecycle = $Window.FindName('cbEmptyRecycle')
$cbClearUpdate = $Window.FindName('cbClearUpdate')
$cbFlushDNS = $Window.FindName('cbFlushDNS')
$cbClearStore = $Window.FindName('cbClearStore')
$cbClearRecent = $Window.FindName('cbClearRecent')
$cbDisableFastStartup = $Window.FindName('cbDisableFastStartup')
$cbDisableTelemetry = $Window.FindName('cbDisableTelemetry')

# Experiencia e Desempenho (Windows 11)
$cbDisableGameBar = $Window.FindName('cbDisableGameBar')
$cbDisableAnimations = $Window.FindName('cbDisableAnimations')
$cbEnableStorageSense = $Window.FindName('cbEnableStorageSense')
$cbDisableSuggestions = $Window.FindName('cbDisableSuggestions')
$cbDisableWidgets = $Window.FindName('cbDisableWidgets')
$cbDisableBackgroundApps = $Window.FindName('cbDisableBackgroundApps')
$cbDisableCopilot = $Window.FindName('cbDisableCopilot')

$cbRestorePoint = $Window.FindName('cbRestorePoint')

# Debloat tab controls
$btnApplyDebloat = $Window.FindName('btnApplyDebloat')
$btnSimulateDebloat = $Window.FindName('btnSimulateDebloat')
$btnSelectAllDebloat = $Window.FindName('btnSelectAllDebloat')
$btnClearAllDebloat = $Window.FindName('btnClearAllDebloat')

# Apps Recomendados Manter (Azul)
$cbKeepNotepad = $Window.FindName('cbKeepNotepad')
$cbKeepCalculator = $Window.FindName('cbKeepCalculator')
$cbKeepPhotos = $Window.FindName('cbKeepPhotos')
$cbKeepStore = $Window.FindName('cbKeepStore')

# Apps Recomendados Remover (Vermelho)
$cbRemoveCandyCrush = $Window.FindName('cbRemoveCandyCrush')
$cbRemoveXbox = $Window.FindName('cbRemoveXbox')
$cbRemoveSkype = $Window.FindName('cbRemoveSkype')
$cbRemoveSolitaire = $Window.FindName('cbRemoveSolitaire')
$cbRemoveGetHelp = $Window.FindName('cbRemoveGetHelp')
$cbRemoveTips = $Window.FindName('cbRemoveTips')
$cbRemoveOffice = $Window.FindName('cbRemoveOffice')
$cbRemoveOneDrive = $Window.FindName('cbRemoveOneDrive')

# Servicos Pesados (Laranja)
 $cbDisableSearch = $Window.FindName('cbDisableWindowsSearch')
$cbDisableCortana = $Window.FindName('cbDisableCortana')
$cbDisableSuperfetch = $Window.FindName('cbDisableSuperfetch')
$cbDisableFax = $Window.FindName('cbDisableFax')
$cbDisableTabletInput = $Window.FindName('cbDisableTabletInput')

$btnRevertFastStartup = $Window.FindName('btnRevertFastStartup')
$btnRevertTelemetry = $Window.FindName('btnRevertTelemetry')

#endregion UI XAML

#region Logica de UI

Write-LogUI "${script:AppName} iniciado. Admin: $([bool](Test-IsAdmin))"
if ($NoElevation) { Write-LogUI 'Modo sem elevacao: executando no mesmo terminal.' 'INFO' }

# Window control button events
$MinimizeButton.Add_Click({ $script:Window.WindowState = [System.Windows.WindowState]::Minimized })
$MaximizeButton.Add_Click({ 
    if ($script:Window.WindowState -eq [System.Windows.WindowState]::Maximized) {
        $script:Window.WindowState = [System.Windows.WindowState]::Normal
        $MaximizeButton.Content = "&#xE922;"  # Maximize icon
        $MaximizeButton.ToolTip = "Maximizar"
    } else {
        $script:Window.WindowState = [System.Windows.WindowState]::Maximized
        $MaximizeButton.Content = "&#xE923;"  # Restore icon
        $MaximizeButton.ToolTip = "Restaurar"
    }
})
$CloseButton.Add_Click({ $script:Window.Close() })

# Window dragging functionality
$DragArea.Add_MouseLeftButtonDown({
    if ($_.ClickCount -eq 2) {
        # Double-click to maximize/restore
        if ($script:Window.WindowState -eq [System.Windows.WindowState]::Maximized) {
            $script:Window.WindowState = [System.Windows.WindowState]::Normal
            $MaximizeButton.Content = "&#xE922;"
            $MaximizeButton.ToolTip = "Maximizar"
        } else {
            $script:Window.WindowState = [System.Windows.WindowState]::Maximized
            $MaximizeButton.Content = "&#xE923;"
            $MaximizeButton.ToolTip = "Restaurar"
        }
    } else {
        # Single-click to drag
        $script:Window.DragMove()
    }
})

$btnRelaunchAdmin.Add_Click({ Restart-Admin })
$btnSaveLog.Add_Click({
    try {
        $dlg = New-Object Microsoft.Win32.SaveFileDialog
        $dlg.FileName = "win11god-log-$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
        $dlg.Filter = 'Text Files (*.txt)|*.txt|All Files (*.*)|*.*'
        if ($dlg.ShowDialog()) {
            [IO.File]::WriteAllText($dlg.FileName, $script:LogBox.Text)
            Write-LogUI "Log salvo em: $($dlg.FileName)" 'SUCCESS'
        }
    } catch {
        Write-LogUI "Falha ao salvar log: $($_.Exception.Message)" 'WARN'
    }
})

$btnSelectAllGeral.Add_Click({
    foreach ($cb in @(
        $cbCleanTemp,$cbEmptyRecycle,$cbClearUpdate,$cbFlushDNS,$cbClearStore,$cbClearRecent,
        $cbDisableFastStartup,$cbDisableTelemetry,$cbRestorePoint,
        $cbDisableGameBar,$cbDisableAnimations,$cbEnableStorageSense,$cbDisableSuggestions,$cbDisableWidgets,$cbDisableBackgroundApps,$cbDisableCopilot
    )) { if ($cb) { $cb.IsChecked = $true } }
})

$btnClearAllGeral.Add_Click({
    foreach ($cb in @(
        $cbCleanTemp,$cbEmptyRecycle,$cbClearUpdate,$cbFlushDNS,$cbClearStore,$cbClearRecent,
        $cbDisableFastStartup,$cbDisableTelemetry,$cbRestorePoint,
        $cbDisableGameBar,$cbDisableAnimations,$cbEnableStorageSense,$cbDisableSuggestions,$cbDisableWidgets,$cbDisableBackgroundApps,$cbDisableCopilot
    )) { if ($cb) { $cb.IsChecked = $false } }
})

# Event handlers removidos para botões que não existem mais na interface
# $btnSelectAllReverter.Add_Click({
#     # No checkboxes in Reverter tab, this is just for consistency
# })

# $btnClearAllReverter.Add_Click({
#     # No checkboxes in Reverter tab, this is just for consistency
# })

$btnRevertFastStartup.Add_Click({ Invoke-Safely { Restore-FastStartup } 'Reativar Inicializacao Rapida' | Out-Null })
$btnRevertTelemetry.Add_Click({ Invoke-Safely { Restore-Telemetry } 'Reverter Telemetria' | Out-Null })

function Set-UIBusy {
    param([bool]$Busy)
    $update = {
        $btnApplyGeral.IsEnabled      = -not $Busy
        # Botão removido da interface de reversão
        # $btnApplyReverter.IsEnabled   = -not $Busy
        $btnSelectAllGeral.IsEnabled  = -not $Busy
        $btnClearAllGeral.IsEnabled   = -not $Busy
        # Botões removidos da interface de reversão
        # $btnSelectAllReverter.IsEnabled = -not $Busy
        # $btnClearAllReverter.IsEnabled  = -not $Busy
        $btnApplyDebloat.IsEnabled    = -not $Busy
        $btnSelectAllDebloat.IsEnabled = -not $Busy
        $btnClearAllDebloat.IsEnabled = -not $Busy
        if ($btnRelaunchAdmin) { $btnRelaunchAdmin.IsEnabled = -not $Busy }
        $btnSaveLog.IsEnabled         = -not $Busy
        $script:Window.Cursor = if ($Busy) { [System.Windows.Input.Cursors]::Wait } else { [System.Windows.Input.Cursors]::Arrow }
    }
    if ($script:Window -and $script:Window.Dispatcher) { $script:Window.Dispatcher.Invoke($update) } else { & $update }
}

function Set-Progress {
    param([int]$Percent)
    if ($Percent -lt 0) { $Percent = 0 }
    if ($Percent -gt 100) { $Percent = 100 }
    $update = { $ProgressBar.Value = $Percent }
    if ($script:Window -and $script:Window.Dispatcher) { $script:Window.Dispatcher.Invoke($update) } else { & $update }
}

function Invoke-SelectedOptimizations {
    # Checagem de compatibilidade
    $isWin11 = Test-IsWindows11
    $tasks = @()
    if ($cbCleanTemp.IsChecked) { $tasks += @{ Name='Limpar Temp'; Action = { Optimize-CleanTemp } } }
    if ($cbEmptyRecycle.IsChecked) { $tasks += @{ Name='Esvaziar Lixeira'; Action = { Optimize-EmptyRecycleBin } } }
    if ($cbClearUpdate.IsChecked) { $tasks += @{ Name='Limpar Windows Update'; Action = { Optimize-ClearWinUpdateCache } } }
    if ($cbFlushDNS.IsChecked) { $tasks += @{ Name='Flush DNS'; Action = { Optimize-FlushDNS } } }
    if ($cbClearStore.IsChecked) { $tasks += @{ Name='Limpar Store'; Action = { Optimize-ClearStoreCache } } }
    if ($cbClearRecent.IsChecked) { $tasks += @{ Name='Limpar Recentes'; Action = { Optimize-ClearRecentFiles } } }
    if ($cbDisableFastStartup.IsChecked) { $tasks += @{ Name='Desativar Inicializacao Rapida'; Action = { Optimize-DisableFastStartup } } }
    if ($cbDisableTelemetry.IsChecked) { $tasks += @{ Name='Reduzir Telemetria'; Action = { Optimize-DisableTelemetry } } }

    if ($tasks.Count -eq 0) {
        [System.Windows.MessageBox]::Show('Nenhuma otimizacao selecionada.','win11god','OK','Information') | Out-Null
        return
    }

    if ($cbRestorePoint.IsChecked) { New-RestorePoint | Out-Null }

    Test-Admin

    try {
        Set-UIBusy $true
        $total = $tasks.Count
        $i = 0
        foreach ($t in $tasks) {
            $i++
            $pct = [int](($i-1)/$total*100)
            Set-Progress $pct
            Invoke-Safely $t.Action $t.Name | Out-Null
        }
        Set-Progress 100
        Write-LogUI 'Todas as tarefas concluidas.' 'SUCCESS'
        $msg = if ($isWin11) { 'Tarefas concluidas. Verifique o log para detalhes.' } else { 'Tarefas concluidas (execucao fora do Windows 11; veja o log).' }
        [System.Windows.MessageBox]::Show($msg,'win11god','OK','Information') | Out-Null
    } finally {
        Set-UIBusy $false
        Start-Sleep -Milliseconds 500
        Set-Progress 0
    }
}

function Invoke-DebloatOperations {
    $tasks = @()
    
    # Apps para remover
    if ($cbRemoveCandyCrush.IsChecked) { $tasks += @{ Name='Remover Candy Crush'; Action = { Remove-WindowsApp -AppName 'king.com.CandyCrushSaga' -DisplayName 'Candy Crush Saga' } } }
    if ($cbRemoveXbox.IsChecked) { $tasks += @{ Name='Remover Xbox Apps'; Action = { 
        Remove-WindowsApp -AppName 'Microsoft.XboxApp' -DisplayName 'Xbox Console Companion'
        Remove-WindowsApp -AppName 'Microsoft.XboxGameOverlay' -DisplayName 'Xbox Game Bar'
        Remove-WindowsApp -AppName 'Microsoft.XboxGamingOverlay' -DisplayName 'Xbox Gaming Overlay'
        Remove-WindowsApp -AppName 'Microsoft.XboxIdentityProvider' -DisplayName 'Xbox Identity Provider'
    } } }
    if ($cbRemoveSkype.IsChecked) { $tasks += @{ Name='Remover Skype'; Action = { Remove-WindowsApp -AppName 'Microsoft.SkypeApp' -DisplayName 'Skype' } } }
    if ($cbRemoveSolitaire.IsChecked) { $tasks += @{ Name='Remover Microsoft Solitaire'; Action = { Remove-WindowsApp -AppName 'Microsoft.MicrosoftSolitaireCollection' -DisplayName 'Microsoft Solitaire Collection' } } }
    if ($cbRemoveGetHelp.IsChecked) { $tasks += @{ Name='Remover Get Help'; Action = { Remove-WindowsApp -AppName 'Microsoft.GetHelp' -DisplayName 'Get Help' } } }
    if ($cbRemoveTips.IsChecked) { $tasks += @{ Name='Remover Tips'; Action = { Remove-WindowsApp -AppName 'Microsoft.Getstarted' -DisplayName 'Tips' } } }
    if ($cbRemoveOffice.IsChecked) { $tasks += @{ Name='Remover Office Hub'; Action = { Remove-WindowsApp -AppName 'Microsoft.MicrosoftOfficeHub' -DisplayName 'Office' } } }
    if ($cbRemoveOneDrive.IsChecked) { $tasks += @{ Name='Remover OneDrive'; Action = { Remove-WindowsApp -AppName 'Microsoft.OneDrive' -DisplayName 'OneDrive' } } }
    
    # Servicos para desabilitar
    if ($cbDisableSearch.IsChecked) { $tasks += @{ Name='Desabilitar Windows Search'; Action = { Disable-WindowsService -ServiceName 'WSearch' -DisplayName 'Windows Search' } } }
    if ($cbDisableCortana.IsChecked) { $tasks += @{ Name='Desabilitar Cortana'; Action = { 
        Disable-WindowsService -ServiceName 'CDPSvc' -DisplayName 'Connected Devices Platform Service'
        # Desabilitar Cortana via registro
        try {
            New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Force | Out-Null
            Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowCortana' -Value 0 -Force
            Write-LogUI 'Cortana desabilitada via registro.' 'SUCCESS'
        } catch {
            Write-LogUI "Falha ao desabilitar Cortana: $($_.Exception.Message)" 'WARN'
        }
    } } }
    if ($cbDisableSuperfetch.IsChecked) { $tasks += @{ Name='Desabilitar Superfetch'; Action = { Disable-WindowsService -ServiceName 'SysMain' -DisplayName 'Superfetch (SysMain)' } } }
    if ($cbDisableFax.IsChecked) { $tasks += @{ Name='Desabilitar Fax'; Action = { Disable-WindowsService -ServiceName 'Fax' -DisplayName 'Fax Service' } } }
    if ($cbDisableTabletInput.IsChecked) { $tasks += @{ Name='Desabilitar Tablet Input'; Action = { Disable-WindowsService -ServiceName 'TabletInputService' -DisplayName 'Tablet PC Input Service' } } }

    if ($tasks.Count -eq 0) {
        [System.Windows.MessageBox]::Show('Nenhuma operacao de debloat selecionada.','win11god','OK','Information') | Out-Null
        return
    }

    $result = [System.Windows.MessageBox]::Show('Deseja criar um ponto de restauracao antes do debloat?','win11god','YesNo','Question')
    if ($result -eq 'Yes') { New-RestorePoint | Out-Null }

    Test-Admin

    try {
        Set-UIBusy $true
        $total = $tasks.Count
        $i = 0
        foreach ($t in $tasks) {
            $i++
            $pct = [int](($i-1)/$total*100)
            Set-Progress $pct
            Invoke-Safely $t.Action $t.Name | Out-Null
        }
        Set-Progress 100
        Write-LogUI 'Operacoes de debloat concluidas.' 'SUCCESS'
        [System.Windows.MessageBox]::Show('Debloat concluido. Verifique o log para detalhes. Reinicie o sistema para aplicar todas as mudancas.','win11god','OK','Information') | Out-Null
    } finally {
        Set-UIBusy $false
        Start-Sleep -Milliseconds 500
        Set-Progress 0
    }
}

# Funcao para aplicar baseado na aba ativa
function Invoke-ActiveTabOperations {
    $activeTabIndex = $MainTabControl.SelectedIndex
    
    switch ($activeTabIndex) {
        0 { # Aba "Geral"
            Invoke-SelectedOptimizations
        }
        2 { # Aba "Debloat" (indice 2 porque "Reverter" e indice 1)
            Invoke-DebloatOperations
        }
        default {
            [System.Windows.MessageBox]::Show("Selecione a aba 'Geral' ou 'Debloat' para aplicar otimizacoes.", "Aviso", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information)
        }
    }
}

# Nova implementacao sincrona e robusta para otimizacoes
function Invoke-SelectedOptimizationsNew {
    param([switch]$Simulate)
    Write-LogUI "=== INICIANDO NOVA LOGICA DE OTIMIZACOES (BACKGROUND) ===" 'INFO'

    $isAdmin = Test-IsAdmin
    
    # Coleta todas as tarefas selecionadas
    $tasks = @()
    if ($cbCleanTemp.IsChecked) { 
        $tasks += @{ Name='Limpar Temp'; Action = { Optimize-CleanTemp }; Priority = 'High' }
        Write-LogUI "Tarefa adicionada: Limpar Temp" 'DEBUG'
    }
    if ($cbEmptyRecycle.IsChecked) { 
        $tasks += @{ Name='Esvaziar Lixeira'; Action = { Optimize-EmptyRecycleBin }; Priority = 'Medium' }
        Write-LogUI "Tarefa adicionada: Esvaziar Lixeira" 'DEBUG'
    }
    if ($cbClearUpdate.IsChecked) { 
        $tasks += @{ Name='Limpar Windows Update'; Action = { Optimize-ClearWinUpdateCache }; Priority = 'High' }
        Write-LogUI "Tarefa adicionada: Limpar Windows Update" 'DEBUG'
    }
    if ($cbFlushDNS.IsChecked) { 
        $tasks += @{ Name='Flush DNS'; Action = { Optimize-FlushDNS }; Priority = 'Medium' }
        Write-LogUI "Tarefa adicionada: Flush DNS" 'DEBUG'
    }
    if ($cbClearStore.IsChecked) { 
        $tasks += @{ Name='Limpar Store'; Action = { Optimize-ClearStoreCache }; Priority = 'Medium' }
        Write-LogUI "Tarefa adicionada: Limpar Store" 'DEBUG'
    }
    if ($cbClearRecent.IsChecked) { 
        $tasks += @{ Name='Limpar Recentes'; Action = { Optimize-ClearRecentFiles }; Priority = 'Low' }
        Write-LogUI "Tarefa adicionada: Limpar Recentes" 'DEBUG'
    }
    if ($cbDisableFastStartup.IsChecked) { 
        $tasks += @{ Name='Desativar Inicializacao Rapida'; Action = { Optimize-DisableFastStartup }; Priority = 'High' }
        Write-LogUI "Tarefa adicionada: Desativar Inicializacao Rapida" 'DEBUG'
    }
    if ($cbDisableTelemetry.IsChecked) { 
        $tasks += @{ Name='Reduzir Telemetria'; Action = { Optimize-DisableTelemetry }; Priority = 'High' }
        Write-LogUI "Tarefa adicionada: Reduzir Telemetria" 'DEBUG'
    }

    # Windows 11 - Experiencia e Desempenho
    if ($cbDisableGameBar.IsChecked) {
        $tasks += @{ Name='Desativar Game Bar/DVR'; Action = { $null }; Priority = 'Medium' }
        Write-LogUI "Tarefa adicionada: Desativar Game Bar/DVR" 'DEBUG'
    }
    if ($cbDisableAnimations.IsChecked) {
        $tasks += @{ Name='Reduzir animacoes da interface'; Action = { $null }; Priority = 'Low' }
        Write-LogUI "Tarefa adicionada: Reduzir animacoes da interface" 'DEBUG'
    }
    if ($cbEnableStorageSense.IsChecked) {
        $tasks += @{ Name='Ativar Storage Sense (limpeza automatica)'; Action = { $null }; Priority = 'Medium' }
        Write-LogUI "Tarefa adicionada: Ativar Storage Sense (limpeza automatica)" 'DEBUG'
    }
    if ($cbDisableSuggestions.IsChecked) {
        $tasks += @{ Name='Desativar sugestoes e dicas'; Action = { $null }; Priority = 'Medium' }
        Write-LogUI "Tarefa adicionada: Desativar sugestoes e dicas" 'DEBUG'
    }
    if ($cbDisableWidgets.IsChecked) {
        $tasks += @{ Name='Desativar Widgets'; Action = { $null }; Priority = 'Low' }
        Write-LogUI "Tarefa adicionada: Desativar Widgets" 'DEBUG'
    }
    if ($cbDisableBackgroundApps.IsChecked) {
        $tasks += @{ Name='Desativar apps em segundo plano'; Action = { $null }; Priority = 'High' }
        Write-LogUI "Tarefa adicionada: Desativar apps em segundo plano" 'DEBUG'
    }
    if ($cbDisableCopilot.IsChecked) {
        $tasks += @{ Name='Desativar Copilot'; Action = { $null }; Priority = 'High' }
        Write-LogUI "Tarefa adicionada: Desativar Copilot" 'DEBUG'
    }

    Write-LogUI "Total de tarefas coletadas: $($tasks.Count)" 'INFO'
    
    if ($tasks.Count -eq 0) {
        Write-LogUI 'ERRO: Nenhuma otimizacao foi selecionada!' 'ERROR'
        [System.Windows.MessageBox]::Show('Nenhuma otimizacao selecionada. Marque pelo menos uma opcao.','win11god - Erro','OK','Warning') | Out-Null
        return $false
    }

    # Modo simulacao: apenas listar tarefas, sem executar
    if ($Simulate) {
        $names = $tasks | ForEach-Object { "- $($_.Name)" }
        $msg = "Simulacao: As seguintes otimizacoes seriam executadas:`n" + ($names -join "`n") + "`n`nNenhuma alteracao foi aplicada."
        Write-LogUI "SIMULACAO (Geral):" 'INFO'
        foreach ($n in $names) { Write-LogUI $n 'DEBUG' }
        [System.Windows.MessageBox]::Show($msg, 'win11god - Simulacao', 'OK', 'Information') | Out-Null
        return $true
    }

    # Verificacao de privilegios
    if (-not $isAdmin) {
        Write-LogUI "AVISO: Executando sem privilegios de administrador!" 'WARN'
        $result = [System.Windows.MessageBox]::Show("Voce nao esta executando como administrador.`nAlgumas otimizacoes podem falhar.`n`nDeseja continuar mesmo assim?", "Aviso - Privilegios", [System.Windows.MessageBoxButton]::YesNo, [System.Windows.MessageBoxImage]::Warning)
        if ($result -eq 'No') {
            Write-LogUI "Execucao cancelada pelo usuario (falta de privilegios)" 'INFO'
            return $false
        }
        Write-LogUI "Usuario optou por continuar sem privilegios de administrador" 'INFO'
    } else {
        Write-LogUI "Executando com privilegios de administrador - OK" 'SUCCESS'
    }

    # Criar ponto de restauracao se solicitado
    $createRestore = $cbRestorePoint.IsChecked
    if ($createRestore) {
        Write-LogUI "Criando ponto de restauracao..." 'INFO'
        try {
            New-RestorePoint | Out-Null
            Write-LogUI "Ponto de restauracao criado com sucesso" 'SUCCESS'
        } catch {
            Write-LogUI "Falha ao criar ponto de restauracao: $($_.Exception.Message)" 'WARN'
        }
    }

    # Executar otimizacoes em background usando Runspaces
    Write-LogUI "=== INICIANDO EXECUCAO EM BACKGROUND (Runspaces) ===" 'INFO'
    
    try {
        Set-UIBusy $true
        
        # Criar Runspace para execucao em thread separada
        $runspace = [runspacefactory]::CreateRunspace()
        $runspace.Open()
        
        # Criar PowerShell instance
        $powershell = [powershell]::Create()
        $powershell.Runspace = $runspace
        
        # Script para executar no background
        $scriptBlock = {
            param($taskList)
            
            $results = @{
                SuccessCount = 0
                FailCount = 0
                Total = $taskList.Count
                Details = @()
            }
            
            for ($i = 0; $i -lt $taskList.Count; $i++) {
                $task = $taskList[$i]
                $progress = [int](($i / $taskList.Count) * 100)
                
                try {
                    $result = $null
                    switch ($task.Name) {
                        'Limpar Temp' { 
                            Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
                            $result = $true
                        }
                        'Esvaziar Lixeira' { 
                            Clear-RecycleBin -Force -ErrorAction SilentlyContinue
                            $result = $true
                        }
                        'Limpar Windows Update' { 
                            Stop-Service wuauserv -Force -ErrorAction SilentlyContinue
                            Remove-Item -Path "$env:SystemRoot\SoftwareDistribution\*" -Recurse -Force -ErrorAction SilentlyContinue
                            Start-Service wuauserv -ErrorAction SilentlyContinue
                            $result = $true
                        }
                        'Flush DNS' { 
                            ipconfig /flushdns | Out-Null
                            $result = $true
                        }
                        'Limpar Store' { 
                            Start-Process wsreset.exe -ArgumentList '/i' -WindowStyle Hidden -Wait -ErrorAction SilentlyContinue
                            $result = $true
                        }
                        'Limpar Recentes' { 
                            Remove-Item -Path "$env:APPDATA\Microsoft\Windows\Recent\*" -Force -ErrorAction SilentlyContinue
                            $result = $true
                        }
                        'Desativar Inicializacao Rapida' { 
                            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name "HiberbootEnabled" -Value 0 -ErrorAction SilentlyContinue
                            $result = $true
                        }
                        'Reduzir Telemetria' { 
                            Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -ErrorAction SilentlyContinue
                            $result = $true
                        }
                        'Desativar Game Bar/DVR' {
                            try {
                                New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Force | Out-Null
                                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Name "AllowGameDVR" -Value 0 -ErrorAction SilentlyContinue
                                New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Force | Out-Null
                                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -ErrorAction SilentlyContinue
                                New-Item -Path "HKCU:\System\GameConfigStore" -Force | Out-Null
                                Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Value 0 -ErrorAction SilentlyContinue
                                New-Item -Path "HKCU:\Software\Microsoft\GameBar" -Force | Out-Null
                                Set-ItemProperty -Path "HKCU:\Software\Microsoft\GameBar" -Name "ShowStartupPanel" -Value 0 -ErrorAction SilentlyContinue
                                $result = $true
                            } catch { $result = $false }
                        }
                        'Reduzir animacoes da interface' {
                            try {
                                New-Item -Path "HKCU:\Control Panel\Accessibility" -Force | Out-Null
                                Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility" -Name "Animation" -Value "0" -ErrorAction SilentlyContinue
                                New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Force | Out-Null
                                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Value 0 -ErrorAction SilentlyContinue
                                New-Item -Path "HKCU:\Software\Microsoft\Windows\DWM" -Force | Out-Null
                                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "EnableAeroPeek" -Value 0 -ErrorAction SilentlyContinue
                                $result = $true
                            } catch { $result = $false }
                        }
                        'Ativar Storage Sense (limpeza automatica)' {
                            try {
                                New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" -Force | Out-Null
                                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" -Name "01" -Value 1 -ErrorAction SilentlyContinue
                                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" -Name "2048" -Value 1 -ErrorAction SilentlyContinue
                                $result = $true
                            } catch { $result = $false }
                        }
                        'Desativar sugestoes e dicas' {
                            try {
                                $cdm = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
                                New-Item -Path $cdm -Force | Out-Null
                                Set-ItemProperty -Path $cdm -Name "SystemPaneSuggestionsEnabled" -Value 0 -ErrorAction SilentlyContinue
                                Set-ItemProperty -Path $cdm -Name "ContentDeliveryAllowed" -Value 0 -ErrorAction SilentlyContinue
                                Set-ItemProperty -Path $cdm -Name "SoftLandingEnabled" -Value 0 -ErrorAction SilentlyContinue
                                Set-ItemProperty -Path $cdm -Name "SubscribedContent-338387Enabled" -Value 0 -ErrorAction SilentlyContinue
                                Set-ItemProperty -Path $cdm -Name "SubscribedContent-353694Enabled" -Value 0 -ErrorAction SilentlyContinue
                                Set-ItemProperty -Path $cdm -Name "SubscribedContent-353696Enabled" -Value 0 -ErrorAction SilentlyContinue
                                $result = $true
                            } catch { $result = $false }
                        }
                        'Desativar Widgets' {
                            try {
                                $adv = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
                                New-Item -Path $adv -Force | Out-Null
                                Set-ItemProperty -Path $adv -Name "TaskbarDa" -Value 0 -ErrorAction SilentlyContinue
                                $result = $true
                            } catch { $result = $false }
                        }
                        'Desativar apps em segundo plano' {
                            try {
                                New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Force | Out-Null
                                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Name "GlobalUserDisabled" -Value 1 -ErrorAction SilentlyContinue
                                New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" -Force | Out-Null
                                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsRunInBackground" -Value 2 -ErrorAction SilentlyContinue
                                $result = $true
                            } catch { $result = $false }
                        }
                        'Desativar Copilot' {
                            try {
                                New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Force | Out-Null
                                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "TurnOffWindowsCopilot" -Value 1 -ErrorAction SilentlyContinue
                                $adv = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
                                New-Item -Path $adv -Force | Out-Null
                                Set-ItemProperty -Path $adv -Name "ShowCopilotButton" -Value 0 -ErrorAction SilentlyContinue
                                $result = $true
                            } catch { $result = $false }
                        }
                        default { $result = $false }
                    }
                    
                    if ($result) {
                        $results.SuccessCount++
                        $results.Details += "SUCESSO: $($task.Name)"
                    } else {
                        $results.FailCount++
                        $results.Details += "FALHA: $($task.Name)"
                    }
                } catch {
                    $results.FailCount++
                    $results.Details += "EXCECAO em $($task.Name): $($_.Exception.Message)"
                }
                
                # Simular progresso
                Write-Progress -Activity "Executando otimizacoes" -Status $task.Name -PercentComplete $progress
            }
            
            return $results
        }
        
        # Adicionar script e parametros
        $powershell.AddScript($scriptBlock).AddArgument($tasks) | Out-Null
        
        # Iniciar execucao assincrona
        Write-LogUI "Iniciando Runspace..." 'INFO'
        $asyncResult = $powershell.BeginInvoke()
        
        # Aguardar conclusao mantendo UI responsiva
        $progressCounter = 0
        while (-not $asyncResult.IsCompleted) {
            $script:Window.Dispatcher.Invoke([System.Windows.Threading.DispatcherPriority]::Background, [System.Action]{
                # Atualizar progresso estimado
                $estimatedProgress = [Math]::Min(90, $progressCounter * 2)
                Set-Progress $estimatedProgress
            })
            Start-Sleep -Milliseconds 200
            $progressCounter++
        }
        
        # Obter resultados
        $results = $powershell.EndInvoke($asyncResult)
        
        # Limpar recursos
        $powershell.Dispose()
        $runspace.Close()
        $runspace.Dispose()
        
        Write-LogUI "=== EXECUCAO EM BACKGROUND CONCLUIDA ===" 'INFO'
        if ($results) {
            $successCount = $results.SuccessCount
            $failCount = $results.FailCount
            $total = $results.Total
            
            # Log dos detalhes
            foreach ($detail in $results.Details) {
                if ($detail.StartsWith("SUCESSO")) {
                    Write-LogUI $detail 'SUCCESS'
                } else {
                    Write-LogUI $detail 'ERROR'
                }
            }
            
            Write-LogUI "Sucessos: $successCount | Falhas: $failCount | Total: $total" 'INFO'
            
            $msg = if ($failCount -eq 0) {
                "Todas as $total otimizacoes foram executadas com sucesso!"
            } elseif ($successCount -gt 0) {
                "$successCount de $total otimizacoes executadas com sucesso. $failCount falharam."
            } else {
                "Todas as $total otimizacoes falharam. Verifique o log para detalhes."
            }
            
            $msgType = if ($failCount -eq 0) { 'Information' } elseif ($successCount -gt 0) { 'Warning' } else { 'Error' }
            [System.Windows.MessageBox]::Show($msg, 'win11god - Resultado', 'OK', $msgType) | Out-Null
            
            return ($successCount -gt 0)
        } else {
            Write-LogUI "ERRO: Nenhum resultado retornado do Runspace" 'ERROR'
            [System.Windows.MessageBox]::Show("Erro inesperado: Nenhum resultado retornado.", 'win11god - Erro', 'OK', 'Error') | Out-Null
            return $false
        }
        
    } catch {
        Write-LogUI "ERRO CRITICO durante execucao das otimizacoes: $($_.Exception.Message)" 'ERROR'
        [System.Windows.MessageBox]::Show("Erro critico durante a execucao das otimizacoes:`n$($_.Exception.Message)", 'win11god - Erro Critico', 'OK', 'Error') | Out-Null
        return $false
    } finally {
        Set-UIBusy $false
        Start-Sleep -Milliseconds 500
        Set-Progress 0
        Write-LogUI "=== LIMPEZA FINAL CONCLUIDA ===" 'INFO'
    }
}

# Nova implementacao sincrona e robusta para debloat
function Invoke-DebloatOperationsNew {
    param([switch]$Simulate)
    Write-LogUI "=== INICIANDO NOVA LOGICA DE DEBLOAT (BACKGROUND) ===" 'INFO'
    
    $isAdmin = Test-IsAdmin
    
    # Coleta todas as tarefas de debloat selecionadas
    $tasks = @()
    
    # Apps para remover
    if ($cbRemoveCandyCrush.IsChecked) { 
        $tasks += @{ Name='Remover Candy Crush'; Action = { Remove-WindowsApp -AppName 'king.com.CandyCrushSaga' -DisplayName 'Candy Crush Saga' }; Type = 'App' }
        Write-LogUI "Tarefa adicionada: Remover Candy Crush" 'DEBUG'
    }
    if ($cbRemoveXbox.IsChecked) { 
        $tasks += @{ Name='Remover Xbox Apps'; Action = { 
            Remove-WindowsApp -AppName 'Microsoft.XboxApp' -DisplayName 'Xbox Console Companion'
            Remove-WindowsApp -AppName 'Microsoft.XboxGameOverlay' -DisplayName 'Xbox Game Bar'
            Remove-WindowsApp -AppName 'Microsoft.XboxGamingOverlay' -DisplayName 'Xbox Gaming Overlay'
            Remove-WindowsApp -AppName 'Microsoft.XboxIdentityProvider' -DisplayName 'Xbox Identity Provider'
        }; Type = 'App' }
        Write-LogUI "Tarefa adicionada: Remover Xbox Apps" 'DEBUG'
    }
    if ($cbRemoveSkype.IsChecked) { 
        $tasks += @{ Name='Remover Skype'; Action = { Remove-WindowsApp -AppName 'Microsoft.SkypeApp' -DisplayName 'Skype' }; Type = 'App' }
        Write-LogUI "Tarefa adicionada: Remover Skype" 'DEBUG'
    }
    if ($cbRemoveSolitaire.IsChecked) { 
        $tasks += @{ Name='Remover Microsoft Solitaire'; Action = { Remove-WindowsApp -AppName 'Microsoft.MicrosoftSolitaireCollection' -DisplayName 'Microsoft Solitaire Collection' }; Type = 'App' }
        Write-LogUI "Tarefa adicionada: Remover Microsoft Solitaire" 'DEBUG'
    }
    if ($cbRemoveGetHelp.IsChecked) { 
        $tasks += @{ Name='Remover Get Help'; Action = { Remove-WindowsApp -AppName 'Microsoft.GetHelp' -DisplayName 'Get Help' }; Type = 'App' }
        Write-LogUI "Tarefa adicionada: Remover Get Help" 'DEBUG'
    }
    if ($cbRemoveTips.IsChecked) { 
        $tasks += @{ Name='Remover Tips'; Action = { Remove-WindowsApp -AppName 'Microsoft.Getstarted' -DisplayName 'Tips' }; Type = 'App' }
        Write-LogUI "Tarefa adicionada: Remover Tips" 'DEBUG'
    }
    if ($cbRemoveOffice.IsChecked) { 
        $tasks += @{ Name='Remover Office Hub'; Action = { Remove-WindowsApp -AppName 'Microsoft.MicrosoftOfficeHub' -DisplayName 'Office' }; Type = 'App' }
        Write-LogUI "Tarefa adicionada: Remover Office Hub" 'DEBUG'
    }
    if ($cbRemoveOneDrive.IsChecked) { 
        $tasks += @{ Name='Remover OneDrive'; Action = { Remove-WindowsApp -AppName 'Microsoft.OneDrive' -DisplayName 'OneDrive' }; Type = 'App' }
        Write-LogUI "Tarefa adicionada: Remover OneDrive" 'DEBUG'
    }
    
    # Servicos para desabilitar
    if ($cbDisableSearch.IsChecked) { 
        $tasks += @{ Name='Desabilitar Windows Search'; Action = { Disable-WindowsService -ServiceName 'WSearch' -DisplayName 'Windows Search' }; Type = 'Service' }
        Write-LogUI "Tarefa adicionada: Desabilitar Windows Search" 'DEBUG'
    }
    if ($cbDisableCortana.IsChecked) { 
        $tasks += @{ Name='Desabilitar Cortana'; Action = { 
            Disable-WindowsService -ServiceName 'CDPSvc' -DisplayName 'Connected Devices Platform Service'
            try {
                New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Force | Out-Null
                Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowCortana' -Value 0 -Force
                Write-LogUI 'Cortana desabilitada via registro.' 'SUCCESS'
            } catch {
                Write-LogUI "Falha ao desabilitar Cortana: $($_.Exception.Message)" 'WARN'
            }
        }; Type = 'Service' }
        Write-LogUI "Tarefa adicionada: Desabilitar Cortana" 'DEBUG'
    }
    if ($cbDisableSuperfetch.IsChecked) { 
        $tasks += @{ Name='Desabilitar Superfetch'; Action = { Disable-WindowsService -ServiceName 'SysMain' -DisplayName 'Superfetch (SysMain)' }; Type = 'Service' }
        Write-LogUI "Tarefa adicionada: Desabilitar Superfetch" 'DEBUG'
    }
    if ($cbDisableFax.IsChecked) { 
        $tasks += @{ Name='Desabilitar Fax'; Action = { Disable-WindowsService -ServiceName 'Fax' -DisplayName 'Fax Service' }; Type = 'Service' }
        Write-LogUI "Tarefa adicionada: Desabilitar Fax" 'DEBUG'
    }
    if ($cbDisableTabletInput.IsChecked) { 
        $tasks += @{ Name='Desabilitar Tablet Input'; Action = { Disable-WindowsService -ServiceName 'TabletInputService' -DisplayName 'Tablet PC Input Service' }; Type = 'Service' }
        Write-LogUI "Tarefa adicionada: Desabilitar Tablet Input" 'DEBUG'
    }

    Write-LogUI "Total de tarefas de debloat coletadas: $($tasks.Count)" 'INFO'

    if ($tasks.Count -eq 0) {
        Write-LogUI 'ERRO: Nenhuma operacao de debloat foi selecionada!' 'ERROR'
        [System.Windows.MessageBox]::Show('Nenhuma operacao de debloat selecionada. Marque pelo menos uma opcao.','win11god - Erro','OK','Warning') | Out-Null
        return $false
    }

    # Modo simulacao: apenas listar tarefas, sem executar
    if ($Simulate) {
        $names = $tasks | ForEach-Object { "- $($_.Name)" }
        $msg = "Simulacao: As seguintes operacoes de debloat seriam executadas:`n" + ($names -join "`n") + "`n`nNenhuma alteracao foi aplicada."
        Write-LogUI "SIMULACAO (Debloat):" 'INFO'
        foreach ($n in $names) { Write-LogUI $n 'DEBUG' }
        [System.Windows.MessageBox]::Show($msg, 'win11god - Simulacao Debloat', 'OK', 'Information') | Out-Null
        return $true
    }

    # Verificacao de privilegios para debloat
    if (-not $isAdmin) {
        Write-LogUI "AVISO: Executando debloat sem privilegios de administrador!" 'WARN'
        $result = [System.Windows.MessageBox]::Show("Voce nao esta executando como administrador.`nOperacoes de debloat geralmente requerem privilegios elevados.`n`nDeseja continuar mesmo assim?", "Aviso - Privilegios para Debloat", [System.Windows.MessageBoxButton]::YesNo, [System.Windows.MessageBoxImage]::Warning)
        if ($result -eq 'No') {
            Write-LogUI "Execucao de debloat cancelada pelo usuario (falta de privilegios)" 'INFO'
            return $false
        }
        Write-LogUI "Usuario optou por continuar debloat sem privilegios de administrador" 'INFO'
    } else {
        Write-LogUI "Executando debloat com privilegios de administrador - OK" 'SUCCESS'
    }

    # Executar operacoes de debloat em background usando Runspaces
    Write-LogUI "=== INICIANDO EXECUCAO DO DEBLOAT EM BACKGROUND (Runspaces) ===" 'INFO'
    
    try {
        Set-UIBusy $true
        
        # Criar Runspace para execucao em thread separada
        $runspace = [runspacefactory]::CreateRunspace()
        $runspace.Open()
        
        # Criar PowerShell instance
        $powershell = [powershell]::Create()
        $powershell.Runspace = $runspace
        
        # Script para executar no background
        $scriptBlock = {
            param($taskList)
            
            $results = @{
                SuccessCount = 0
                FailCount = 0
                Total = $taskList.Count
                Details = @()
            }
            
            for ($i = 0; $i -lt $taskList.Count; $i++) {
                $task = $taskList[$i]
                $progress = [int](($i / $taskList.Count) * 100)
                
                try {
                    $result = $false
                    
                    if ($task.Type -eq 'App') {
                        # Remover aplicativos
                        switch ($task.Name) {
                            'Remover Candy Crush' {
                                Get-AppxPackage -Name 'king.com.CandyCrushSaga' -AllUsers -ErrorAction SilentlyContinue | Remove-AppxPackage -ErrorAction SilentlyContinue
                                Get-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Where-Object DisplayName -like "*CandyCrush*" | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
                                $result = $true
                            }
                            'Remover Xbox Apps' {
                                @('Microsoft.XboxApp', 'Microsoft.XboxGameOverlay', 'Microsoft.XboxGamingOverlay', 'Microsoft.XboxIdentityProvider') | ForEach-Object {
                                    Get-AppxPackage -Name $_ -AllUsers -ErrorAction SilentlyContinue | Remove-AppxPackage -ErrorAction SilentlyContinue
                                }
                                $result = $true
                            }
                            'Remover Skype' {
                                Get-AppxPackage -Name 'Microsoft.SkypeApp' -AllUsers -ErrorAction SilentlyContinue | Remove-AppxPackage -ErrorAction SilentlyContinue
                                $result = $true
                            }
                            'Remover Microsoft Solitaire' {
                                Get-AppxPackage -Name 'Microsoft.MicrosoftSolitaireCollection' -AllUsers -ErrorAction SilentlyContinue | Remove-AppxPackage -ErrorAction SilentlyContinue
                                $result = $true
                            }
                            'Remover Get Help' {
                                Get-AppxPackage -Name 'Microsoft.GetHelp' -AllUsers -ErrorAction SilentlyContinue | Remove-AppxPackage -ErrorAction SilentlyContinue
                                $result = $true
                            }
                            'Remover Tips' {
                                Get-AppxPackage -Name 'Microsoft.Getstarted' -AllUsers -ErrorAction SilentlyContinue | Remove-AppxPackage -ErrorAction SilentlyContinue
                                $result = $true
                            }
                            'Remover Office Hub' {
                                Get-AppxPackage -Name 'Microsoft.MicrosoftOfficeHub' -AllUsers -ErrorAction SilentlyContinue | Remove-AppxPackage -ErrorAction SilentlyContinue
                                $result = $true
                            }
                            'Remover OneDrive' {
                                Get-AppxPackage -Name 'Microsoft.OneDrive' -AllUsers -ErrorAction SilentlyContinue | Remove-AppxPackage -ErrorAction SilentlyContinue
                                $result = $true
                            }
                        }
                    } elseif ($task.Type -eq 'Service') {
                        # Desabilitar servicos
                        switch ($task.Name) {
                            'Desabilitar Windows Search' {
                                Stop-Service -Name 'WSearch' -Force -ErrorAction SilentlyContinue
                                Set-Service -Name 'WSearch' -StartupType Disabled -ErrorAction SilentlyContinue
                                $result = $true
                            }
                            'Desabilitar Cortana' {
                                Stop-Service -Name 'CDPSvc' -Force -ErrorAction SilentlyContinue
                                Set-Service -Name 'CDPSvc' -StartupType Disabled -ErrorAction SilentlyContinue
                                New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Force -ErrorAction SilentlyContinue | Out-Null
                                Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowCortana' -Value 0 -Force -ErrorAction SilentlyContinue
                                $result = $true
                            }
                            'Desabilitar Superfetch' {
                                Stop-Service -Name 'SysMain' -Force -ErrorAction SilentlyContinue
                                Set-Service -Name 'SysMain' -StartupType Disabled -ErrorAction SilentlyContinue
                                $result = $true
                            }
                            'Desabilitar Fax' {
                                Stop-Service -Name 'Fax' -Force -ErrorAction SilentlyContinue
                                Set-Service -Name 'Fax' -StartupType Disabled -ErrorAction SilentlyContinue
                                $result = $true
                            }
                            'Desabilitar Tablet Input' {
                                Stop-Service -Name 'TabletInputService' -Force -ErrorAction SilentlyContinue
                                Set-Service -Name 'TabletInputService' -StartupType Disabled -ErrorAction SilentlyContinue
                                $result = $true
                            }
                        }
                    }
                    
                    if ($result) {
                        $results.SuccessCount++
                        $results.Details += "SUCESSO: $($task.Name)"
                    } else {
                        $results.FailCount++
                        $results.Details += "FALHA: $($task.Name)"
                    }
                } catch {
                    $results.FailCount++
                    $results.Details += "EXCECAO em $($task.Name): $($_.Exception.Message)"
                }
                
                # Simular progresso
                Write-Progress -Activity "Executando debloat" -Status "$($task.Name) [$($task.Type)]" -PercentComplete $progress
            }
            
            return $results
        }
        
        # Adicionar script e parametros
        $powershell.AddScript($scriptBlock).AddArgument($tasks) | Out-Null
        
        # Iniciar execucao assincrona
        Write-LogUI "Iniciando Runspace para debloat..." 'INFO'
        $asyncResult = $powershell.BeginInvoke()
        
        # Aguardar conclusao mantendo UI responsiva
        $progressCounter = 0
        while (-not $asyncResult.IsCompleted) {
            $script:Window.Dispatcher.Invoke([System.Windows.Threading.DispatcherPriority]::Background, [System.Action]{
                # Atualizar progresso estimado
                $estimatedProgress = [Math]::Min(90, $progressCounter * 2)
                Set-Progress $estimatedProgress
            })
            Start-Sleep -Milliseconds 200
            $progressCounter++
        }
        
        # Obter resultados
        $results = $powershell.EndInvoke($asyncResult)
        
        # Limpar recursos
        $powershell.Dispose()
        $runspace.Close()
        $runspace.Dispose()
        
        Write-LogUI "=== EXECUCAO DO DEBLOAT EM BACKGROUND CONCLUIDA ===" 'INFO'
        
        $results = $script:DebloatResults
        if ($results) {
            $successCount = $results.SuccessCount
            $failCount = $results.FailCount
            $total = $results.Total
            
            # Log dos detalhes
            foreach ($detail in $results.Details) {
                if ($detail.StartsWith("SUCESSO")) {
                    Write-LogUI $detail 'SUCCESS'
                } else {
                    Write-LogUI $detail 'ERROR'
                }
            }
            
            Write-LogUI "Sucessos: $successCount | Falhas: $failCount | Total: $total" 'INFO'
            
            $msg = if ($failCount -eq 0) {
                "Todas as $total operacoes de debloat foram executadas com sucesso!`nReinicie o sistema para aplicar todas as mudancas."
            } elseif ($successCount -gt 0) {
                "$successCount de $total operacoes de debloat executadas com sucesso. $failCount falharam.`nReinicie o sistema para aplicar as mudancas."
            } else {
                "Todas as $total operacoes de debloat falharam. Verifique o log para detalhes."
            }
            
            $msgType = if ($failCount -eq 0) { 'Information' } elseif ($successCount -gt 0) { 'Warning' } else { 'Error' }
            [System.Windows.MessageBox]::Show($msg, 'win11god - Resultado do Debloat', 'OK', $msgType) | Out-Null
            
            return ($successCount -gt 0)
        } else {
            Write-LogUI "ERRO: Nenhum resultado retornado do Runspace de debloat" 'ERROR'
            [System.Windows.MessageBox]::Show("Erro inesperado: Nenhum resultado retornado do debloat.", 'win11god - Erro', 'OK', 'Error') | Out-Null
            return $false
        }
        
    } catch {
        Write-LogUI "ERRO CRITICO durante execucao do debloat: $($_.Exception.Message)" 'ERROR'
        [System.Windows.MessageBox]::Show("Erro critico durante a execucao do debloat:`n$($_.Exception.Message)", 'win11god - Erro Critico', 'OK', 'Error') | Out-Null
        return $false
    } finally {
        Set-UIBusy $false
        Start-Sleep -Milliseconds 500
        Set-Progress 0
        Write-LogUI "=== LIMPEZA FINAL DO DEBLOAT CONCLUIDA ===" 'INFO'
    }
}

# Nova implementacao sincrona e robusta para operacoes da aba ativa
function Invoke-ActiveTabOperationsNew {
    param([switch]$Simulate)
    Write-LogUI "=== INICIANDO NOVA LOGICA DE OPERACOES DA ABA ATIVA ===" 'INFO'
    
    $activeTabIndex = $MainTabControl.SelectedIndex
    Write-LogUI "Aba ativa detectada: Index $activeTabIndex" 'DEBUG'
    
    switch ($activeTabIndex) {
        0 { # Aba "Geral" - Otimizacoes
            Write-LogUI "Executando otimizacoes da aba Geral..." 'INFO'
            return Invoke-SelectedOptimizationsNew -Simulate:$Simulate
        }
        1 { # Aba "Reverter"
            Write-LogUI "Aba Reverter nao possui operacoes automaticas - use os botoes individuais" 'INFO'
            [System.Windows.MessageBox]::Show("A aba 'Reverter' nao possui operacoes automaticas.`nUse os botoes individuais para reverter configuracoes especificas.", "win11god - Informacao", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information) | Out-Null
            return $false
        }
        2 { # Aba "Debloat"
            Write-LogUI "Executando operacoes de debloat..." 'INFO'
            return Invoke-DebloatOperationsNew -Simulate:$Simulate
        }
        default {
            Write-LogUI "Aba nao reconhecida ou invalida: Index $activeTabIndex" 'ERROR'
            [System.Windows.MessageBox]::Show("Selecione a aba 'Geral' ou 'Debloat' para aplicar otimizacoes.", "win11god - Aviso", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information) | Out-Null
            return $false
        }
    }
}

# Event handlers dos botoes - usando as novas funcoes sincronas e robustas
$btnApplyGeral.Add_Click({ Invoke-ActiveTabOperationsNew })
# Botão removido da interface de reversão
# $btnApplyReverter.Add_Click({ Invoke-ActiveTabOperationsNew })
$btnApplyDebloat.Add_Click({ Invoke-DebloatOperationsNew })
$btnSimulateGeral.Add_Click({ Invoke-ActiveTabOperationsNew -Simulate })
$btnSimulateDebloat.Add_Click({ Invoke-DebloatOperationsNew -Simulate })

# Botoes de selecao da aba Debloat
$btnSelectAllDebloat.Add_Click({
    # Apps recomendados remover (vermelho)
    $cbRemoveCandyCrush.IsChecked = $true
    $cbRemoveXbox.IsChecked = $true
    $cbRemoveSkype.IsChecked = $true
    $cbRemoveSolitaire.IsChecked = $true
    $cbRemoveGetHelp.IsChecked = $true
    $cbRemoveTips.IsChecked = $true
    $cbRemoveOffice.IsChecked = $true
    $cbRemoveOneDrive.IsChecked = $true
    
    # Servicos pesados (laranja) - manter desmarcados por padrao (avancado)
    $cbDisableSearch.IsChecked = $false
    $cbDisableCortana.IsChecked = $false
    $cbDisableSuperfetch.IsChecked = $false
    $cbDisableFax.IsChecked = $false
    $cbDisableTabletInput.IsChecked = $false
})

$btnClearAllDebloat.Add_Click({
    # Apps recomendados manter (azul) - manter desmarcados
    $cbKeepNotepad.IsChecked = $false
    $cbKeepCalculator.IsChecked = $false
    $cbKeepPhotos.IsChecked = $false
    $cbKeepStore.IsChecked = $false
    
    # Apps recomendados remover (vermelho)
    $cbRemoveCandyCrush.IsChecked = $false
    $cbRemoveXbox.IsChecked = $false
    $cbRemoveSkype.IsChecked = $false
    $cbRemoveSolitaire.IsChecked = $false
    $cbRemoveGetHelp.IsChecked = $false
    $cbRemoveTips.IsChecked = $false
    $cbRemoveOffice.IsChecked = $false
    $cbRemoveOneDrive.IsChecked = $false
    
    # Servicos pesados (laranja)
    $cbDisableSearch.IsChecked = $false
    $cbDisableCortana.IsChecked = $false
    $cbDisableSuperfetch.IsChecked = $false
    $cbDisableFax.IsChecked = $false
    $cbDisableTabletInput.IsChecked = $false
})

# Links da aba Sobre
if ($btnSite)      { $btnSite.Add_Click({ Start-Process 'https://amathyzin.com.br' }) }
if ($btnPortfolio) { $btnPortfolio.Add_Click({ Start-Process 'https://amathyzin.xyz' }) }
if ($btnYouTube)   { $btnYouTube.Add_Click({ Start-Process 'https://youtube.com/@aMathyzin' }) }
if ($btnDiscord)   { $btnDiscord.Add_Click({ Start-Process 'https://discord.gg/XXquEjp69D' }) }

# Lógica da aba Preferências
$cbLanguage = $script:Window.FindName("cbLanguage")
$btnApplyLanguage = $script:Window.FindName("btnApplyLanguage")

if ($cbLanguage -and $btnApplyLanguage) {
    # Set current language in ComboBox
    switch ($script:CurrentLanguage) {
        'pt' { $cbLanguage.SelectedIndex = 0 }
        'en' { $cbLanguage.SelectedIndex = 1 }
        'es' { $cbLanguage.SelectedIndex = 2 }
    }
    
    # Apply language button event
    $btnApplyLanguage.Add_Click({
        $selectedItem = $cbLanguage.SelectedItem
        if ($selectedItem) {
            $newLanguage = $selectedItem.Tag
            if ($newLanguage -and $script:Translations.ContainsKey($newLanguage)) {
                $script:CurrentLanguage = $newLanguage
                Save-LanguagePreference -Language $newLanguage
                Update-Translations
            }
        }
    })
}

#endregion Logica de UI

# Load saved language preference or show language selection
$savedLanguage = Get-LanguagePreference
if ($savedLanguage -and $script:Translations.ContainsKey($savedLanguage)) {
    $script:CurrentLanguage = $savedLanguage
} else {
    # Show language selection if no valid preference is saved
    Show-LanguageSelection
}

# Apply translations after language is set
Update-Translations

$null = $script:Window.ShowDialog()
