# 🤝 Contributing to AI Testing Agent

Obrigado pelo interesse em contribuir com este projeto de automação de testes! Este guia ajudará você a configurar o ambiente e contribuir efetivamente.

## 🎯 Sobre o Projeto

Este é um projeto de **portfólio de QA** que demonstra habilidades em:
- Robot Framework com SeleniumLibrary
- Page Object Model (POM)
- Waits inteligentes e tratamento de erros
- Pipeline CI/CD multi-stage
- Relatórios Allure
- Multi-browser testing

## 🚀 Configuração do Ambiente

### Pré-requisitos

- **Python 3.8+**
- **Git**
- **Chrome/Firefox/Edge** (para testes locais)

### Instalação

```bash
# 1. Fork e clone o repositório
git clone https://github.com/seu-usuario/ai-testing-agent.git
cd ai-testing-agent

# 2. Crie ambiente virtual
python -m venv venv
venv\Scripts\activate  # Windows
source venv/bin/activate  # Linux/Mac

# 3. Instale dependências
cd the_internet_robot
pip install -r requirements.txt

# 4. Configure ambiente (opcional)
cp .env.example .env
```

## 📝 Padrões de Código

### Robot Framework

- **Indentação**: 4 espaços
- **Nomenclatura**: PascalCase para keywords, snake_case para variáveis
- **Documentação**: Sempre documente keywords complexas
- **Tags**: Use tags descritivas (Smoke, Regression, etc.)

```robot
*** Keywords ***
Enhanced Login Test
    [Documentation]    Performs login with enhanced error handling
    [Tags]    Authentication    Enhanced
    [Arguments]    ${username}    ${password}
    
    Smart Input Text    ${USERNAME_INPUT}    ${username}
    Smart Input Text    ${PASSWORD_INPUT}    ${password}
    Smart Click Element    ${LOGIN_BUTTON}
```

### Python (CustomKeywords)

- **PEP 8**: Siga as convenções Python
- **Type Hints**: Use quando possível
- **Docstrings**: Documente todas as funções
- **Logging**: Use logging ao invés de print

```python
@keyword("Smart Wait For Element")
def smart_wait_for_element(self, locator: str, timeout: int = None) -> WebElement:
    """Wait for element with intelligent timeout handling.
    
    Args:
        locator: Element locator string
        timeout: Custom timeout in seconds
        
    Returns:
        WebElement: The found element
    """
    # Implementation here
```

## 🧪 Executando Testes

### Testes Locais

```bash
# Execução básica
robot --outputdir results tests/ImprovedTests.robot

# Com tags específicas
robot --include Smoke --outputdir results tests/ImprovedTests.robot

# Multi-browser
run_tests_enhanced.bat Chrome prod False
run_tests_enhanced.bat Firefox staging True
```

### Validação Antes do Commit

```bash
# Execute smoke tests
robot --include Smoke --variable HEADLESS_MODE:True tests/ImprovedTests.robot

# Verifique se não há erros de sintaxe
python -m py_compile libraries/CustomKeywords.py
```

## 📋 Processo de Contribuição

### 1. Criando Issues

- **Bug Reports**: Use template de bug com steps to reproduce
- **Feature Requests**: Descreva o valor e casos de uso
- **Questions**: Para dúvidas sobre implementação

### 2. Pull Requests

1. **Crie branch descritiva**:
   ```bash
   git checkout -b feature/new-smart-keyword
   git checkout -b fix/login-timeout-issue
   git checkout -b docs/update-readme
   ```

2. **Faça commits semânticos**:
   ```bash
   git commit -m "feat: add smart dropdown selection keyword"
   git commit -m "fix: resolve timeout issue in login tests"
   git commit -m "docs: update installation instructions"
   ```

3. **Teste suas mudanças**:
   ```bash
   # Execute testes relevantes
   robot --include "YourNewFeature" tests/
   
   # Verifique se smoke tests passam
   robot --include Smoke tests/ImprovedTests.robot
   ```

4. **Crie PR com descrição detalhada**:
   - O que foi alterado
   - Por que foi alterado
   - Como testar
   - Screenshots (se aplicável)

### 3. Code Review

- **Todos os PRs** passam por review
- **CI/CD pipeline** deve passar
- **Cobertura de testes** deve ser mantida
- **Documentação** deve ser atualizada

## 🏷️ Sistema de Tags

### Tags de Teste

| Tag | Uso | Descrição |
|-----|-----|-----------|
| `Smoke` | Testes críticos | Execução rápida, funcionalidades essenciais |
| `Regression` | Testes completos | Cobertura ampla, validação de releases |
| `Enhanced` | Testes melhorados | Com waits inteligentes e tratamento de erros |
| `DataDriven` | Testes parametrizados | Múltiplos cenários com dados diferentes |

### Tags Funcionais

| Categoria | Tags Disponíveis |
|-----------|------------------|
| **Authentication** | `Login`, `Logout`, `Authentication` |
| **Forms** | `Forms`, `Checkboxes`, `Dropdown`, `Input` |
| **Interaction** | `JavaScript`, `Hovers`, `KeyPresses`, `DragDrop` |
| **Navigation** | `Navigation`, `Links`, `Pages` |
| **Dynamic** | `Dynamic`, `AddRemove`, `Loading` |

## 📊 Estrutura de Arquivos

```
the_internet_robot/
├── 📁 config/           # Configurações e localizadores
├── 📁 libraries/        # Keywords customizadas
├── 📁 resources/        # Page Objects e recursos
│   ├── common/          # Recursos compartilhados
│   └── pages/           # Page Objects específicos
├── 📁 tests/            # Suites de teste
├── 📁 data/             # Dados de teste
└── 📁 results/          # Relatórios e resultados
```

## 🔧 Adicionando Novos Testes

### 1. Identifique a Funcionalidade

- Qual página/funcionalidade será testada?
- Quais cenários são necessários?
- Que tags serão usadas?

### 2. Crie/Atualize Localizadores

```python
# config/locators.py
class NovaPageLocators:
    ELEMENTO_PRINCIPAL = "id:main-element"
    BOTAO_ACAO = "css:.action-button"
    MENSAGEM_SUCESSO = "css:.success-message"
```

### 3. Crie Page Object

```robot
# resources/pages/NovaPage.resource
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ELEMENTO_PRINCIPAL}    id:main-element
${BOTAO_ACAO}           css:.action-button

*** Keywords ***
Navegar Para Nova Pagina
    Go To    ${BASE_URL}nova-pagina

Executar Acao Principal
    Smart Click Element    ${BOTAO_ACAO}
    Smart Wait For Element Visible    ${MENSAGEM_SUCESSO}
```

### 4. Escreva os Testes

```robot
# tests/NovoTeste.robot
*** Settings ***
Resource    ../resources/pages/NovaPage.resource

*** Test Cases ***
Teste Nova Funcionalidade
    [Tags]    Smoke    NovaFuncionalidade
    [Documentation]    Testa a nova funcionalidade implementada
    
    Navegar Para Nova Pagina
    Executar Acao Principal
    Page Should Contain    Sucesso
```

## 🐛 Reportando Bugs

### Template de Bug Report

```markdown
**Descrição do Bug**
Descrição clara e concisa do problema.

**Steps to Reproduce**
1. Vá para '...'
2. Clique em '....'
3. Veja o erro

**Comportamento Esperado**
O que deveria acontecer.

**Comportamento Atual**
O que realmente acontece.

**Screenshots**
Se aplicável, adicione screenshots.

**Ambiente**
- OS: [Windows/Linux/Mac]
- Browser: [Chrome/Firefox/Edge]
- Python Version: [3.8/3.9/3.10/3.11]
- Robot Framework Version: [6.x]
```

## 📈 Métricas de Qualidade

### Objetivos

- **Cobertura de Testes**: Manter > 80%
- **Tempo de Execução**: Smoke tests < 5min
- **Taxa de Sucesso**: > 95% em ambiente estável
- **Manutenibilidade**: Código limpo e documentado

### Monitoramento

- **Pipeline CI/CD**: Execução automática
- **Relatórios Allure**: Dashboards interativos
- **Screenshots**: Captura automática em falhas
- **Logs Detalhados**: Para debugging

## 🎯 Roadmap

### Próximas Funcionalidades

- [ ] Testes de API com RequestsLibrary
- [ ] Integração com Docker
- [ ] Testes de Performance
- [ ] Testes de Acessibilidade
- [ ] Relatórios customizados
- [ ] Integração com Slack/Teams

### Melhorias Técnicas

- [ ] Paralelização de testes
- [ ] Cache de WebDrivers
- [ ] Retry automático inteligente
- [ ] Integração com BrowserStack
- [ ] Testes em dispositivos móveis

## 📞 Contato

- **Issues**: Use GitHub Issues para bugs e features
- **Discussões**: GitHub Discussions para perguntas
- **Email**: Para questões privadas

---

**Obrigado por contribuir! 🚀**

Sua contribuição ajuda a tornar este projeto um exemplo ainda melhor de automação de testes com Robot Framework.