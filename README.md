<div align="center">

  <img src="./win11god.png" alt="Win11God logo" width="96"/>

# Win11God

**Otimizador e Debloater para Windows 11 (compatível com 10)**

  <br/>

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-0273B3?logo=powershell\&logoColor=white)
![Framework](https://img.shields.io/badge/WPF%20XAML-Dark%20UI-5B5B5B)
![OS](https://img.shields.io/badge/Windows-10%20%7C%2011-0078D6?logo=windows\&logoColor=white)
![Status](https://img.shields.io/badge/Status-Ativo-success)

<sub>Interface principal</sub>

  <img src="./screenshot_win11god.png" alt="Win11God UI" width="900"/>
</div>

---

## Sumário

* [Visão Geral](#visão-geral)
* [Destaques](#destaques)
* [Requisitos](#requisitos)
* [Como executar](#como-executar)
* [Funcionalidades](#funcionalidades)
* [Idiomas](#idiomas)
* [Segurança e Reversão](#segurança-e-reversão)
* [Parâmetros de Execução](#parâmetros-de-execução)
* [Logs](#logs)
* [Build para Dev](#build-para-dev)
* [Roadmap](#roadmap)
* [Contribuindo](#contribuindo)
* [FAQ](#faq)
* [Licença](#licença)

## Visão Geral

Ferramenta gráfica em **PowerShell + WPF** para aplicar **otimizações seguras**, reduzir **telemetria**, fazer **limpeza**, e realizar **debloat** seletivo de apps e serviços. Traz **ponto de restauração opcional**, **UI responsiva**, e **modo simulação**.

## Destaques

* ⚡ **One‑click**: selecione e aplique.
* 🧼 **Limpeza rápida**: Temp, Lixeira, Windows Update, Store, Recentes, DNS.
* 🛡️ **Privacidade**: reduz telemetria e desativa serviços/itens de rastreio suportados.
* 🎮 **Performance**: Game Bar/DVR off, animações reduzidas, Storage Sense, sugestões e widgets.
* 📦 **Debloat guiado**: remover UWP bloatware e provisioned packages com critério.
* ♻️ **Reversão**: botões dedicados para restaurar configurações críticas.
* 🌐 **Multi‑idioma**: PT, EN, ES com persistência em `%APPDATA%`.
* 🪟 **Aparência Win11**: Mica/Acrílico, dark, controles customizados.

## Requisitos

* Windows 10 21H2+ ou **Windows 11**.
* **PowerShell 5.1+** (ou 7.x com compatibilidade de WPF no Windows).
* Execução com **Admin** recomendada para mudanças do sistema.

## Como executar

> Sem URLs inventadas. Use o repo local clonado.

```powershell
# 1) Abrir PowerShell como Administrador
# 2) Na pasta do projeto:
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\win11god.ps1
```

Modo sem elevação:

```powershell
.\win11god.ps1 -NoElevation
```

> Dica: a UI pede elevação automática caso necessário. O modo `-NoElevation` mantém tudo no mesmo terminal.

## Funcionalidades

### Geral

* **Limpeza**: Temp, Lixeira, Windows Update cache, Microsoft Store (`wsreset`), recentes/jump lists, flush DNS.
* **Sistema**: Desativar Inicialização Rápida, reduzir Telemetria.
* **Experiência e Desempenho**: Desativar Game Bar/DVR, reduzir animações, ativar Storage Sense, desativar sugestões, widgets, apps em background e Copilot.
* **Restauração**: criação opcional de **Ponto de Restauração**.

### Reverter

* Reativar **Inicialização Rápida**.
* Reverter **Telemetria** e tentar restaurar serviços ligados.
* Restaurar barra de tarefas/menu iniciar/context menu padrão do Win11.
* Botão de **reversão completa** (onde aplicável).

### Debloat (seletivo)

* Remoção de UWP: **Candy Crush, Xbox suite, Skype, Groove Music, Filmes & TV, Microsoft News, Weather, Maps, 3D Viewer,** entre outros.
* Remove também **provisioned packages** para novos usuários quando possível.
* Serviços pesados opcionais: **Windows Search** (indexação), **Fax**, **Tablet Input**, **SysMain**.

## Idiomas

* 🇧🇷 **pt-BR** (padrão)
* 🇺🇸 **en**
* 🇪🇸 **es**

Preferência salva em `%APPDATA%/Win11God/language.json`.

## Segurança e Reversão

* **Ponto de Restauração** integrado via `Checkpoint-Computer`.
* Ações críticas expostas com **botões de desfazer**.
* Logs visíveis em tempo real na UI.

> Aviso: alterações do sistema implicam risco. Leia o log, escolha apenas o que entende e **reinicie** quando for necessário.

## Parâmetros de Execução

```text
-NoElevation  Executa sem solicitar elevação. Algumas ações podem falhar.
```

## Logs

* Painel de log na parte inferior da UI.
* Botão **Salvar Log** exporta `.txt` com timestamp.

## Build para Dev

* Código em **PowerShell** com **WPF (XAML)**.
* Backdrop Mica/Acrylic via P/Invoke (`user32`, `dwmapi`).
* Runspaces para manter a UI responsiva durante tarefas longas.

Estrutura esperada (mínimo):

```
/ (raiz)
  win11god.ps1
  win11god.png
  screenshot_win11god.png
  README.md
```

## Roadmap

* [ ] Perfis de otimização predefinidos (Básico/Equilibrado/Agressivo).
* [ ] Modo **Simulação** completo em todas as ações.
* [ ] Painel de **restauração granular** por item.
* [ ] Telemetria: matriz por edição (Home/Pro/Enterprise) com limites do Windows documentados.
* [ ] Exportar/Importar presets.

## Contribuindo

* **Issues**: relate bugs com log e passos.
* **PRs**: foco em segurança, reversibilidade e UX. Sem links externos não verificados.
* Padrões: evitar “gambiarras”, preferir funções idempotentes, checagens de permissão e try/catch com mensagens claras.

## FAQ

**Funciona no Windows 10?**

> Sim. Otimizações específicas de Win11 aplicam fallback seguro. O log indica o que foi pulado.

**Preciso rodar como Admin?**

> Recomendado. Sem admin, várias ações serão ignoradas.

**Consigo desfazer tudo?**

> Itens críticos têm reversão. Para total segurança, use sempre **Ponto de Restauração**.

**Vai aumentar FPS?**

> Remove gargalos comuns e ruído de background. Ganho varia por máquina e uso.

## Licença

Defina a licença do projeto (ex.: MIT). Inclua o arquivo `LICENSE` na raiz.

---

<div align="center">
  <sub>Feito para quem quer Windows magro, previsível e rápido.</sub>
</div>
