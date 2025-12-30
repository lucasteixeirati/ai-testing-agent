import torch
import os
from transformers import AutoTokenizer, AutoModelForCausalLM

# =========================================================================
# === 1. CONFIGURAÇÕES GLOBAIS: CodeGemma 2B e CPU (SOLUÇÃO FINAL) ===
# =========================================================================

# Variável GLOBAL: Modelo CodeGemma 2B Instruct (Livre de licença e ultraleve)
MODEL_NAME = "codegemma-2b-it" 

# Forçar a execução na CPU para garantir estabilidade (ignora a GPU incompatível)
device = "cpu"
device_map_setting = "cpu" 
print(f"Dispositivo de processamento definido: {device}")


# =========================================================================
# === 2. FUNÇÃO DE CARREGAMENTO DO MODELO ===
# =========================================================================

def load_code_llama(): # Mantemos o nome da função por conveniência, embora carregue CodeGemma
    print(f"Tentando carregar o modelo: {MODEL_NAME}")
    
    try:
        # Carregar o Tokenizer (Não requer 'use_auth_token' para CodeGemma)
        tokenizer = AutoTokenizer.from_pretrained(MODEL_NAME) 
        
        # Carregar o Modelo CodeGemma 2B 
        model = AutoModelForCausalLM.from_pretrained(
            MODEL_NAME, 
            torch_dtype=torch.float16, # Mantém a economia de memória
            device_map=device_map_setting, # Garante que vai para a CPU
        )
        
        tokenizer.pad_token = tokenizer.eos_token 
        
        print(f"\n✅ Modelo {MODEL_NAME} e Tokenizer carregados com sucesso!")
        print(f"Configuração do dispositivo: {model.device}") 
        
        return tokenizer, model
        
    except Exception as e:
        print("\n❌ ERRO ao carregar o modelo:")
        print(f"Detalhes do erro: {e}")
        return None, None


# =========================================================================
# === 3. MÓDULO: Geração de Cenários de Teste (Fase 2) ===
# =========================================================================

def generate_test_scenarios(tokenizer, model, user_story):
    
    system_prompt = (
        "Você é um Engenheiro de Qualidade de Software (QA) sênior e metódico. "
        "Sua tarefa é analisar a User Story fornecida e gerar uma lista detalhada de "
        "cenários de teste. Garanta que a lista cubra os seguintes tipos de teste: "
        "1. Happy Path (Sucesso); 2. Boundary Cases (Limites); 3. Negative Cases (Erros/Segurança). "
        "Apresente a saída como uma lista numerada e clara."
    )
    
    # Formato de Prompt específico para o CodeGemma Instruct
    prompt = f"""<start_of_turn>user
    {system_prompt}
    
    User Story: "{user_story}"
    
    Gere os cenários de teste:<end_of_turn>
    <start_of_turn>model
    """

    inputs = tokenizer(prompt, return_tensors="pt").to(model.device)
    
    # Configurações de geração ajustadas para CPUs
    output = model.generate(
        **inputs, 
        max_new_tokens=400,       
        do_sample=True,
        temperature=0.7,          
        top_p=0.9,                
        pad_token_id=tokenizer.eos_token_id
    )

    generated_text = tokenizer.decode(output[0], skip_special_tokens=True)
    
    # O CodeGemma tem um formato de resposta específico, precisamos limpar apenas a resposta
    response_start_tag = "<start_of_turn>model"
    response_start = generated_text.find(response_start_tag)
    
    if response_start != -1:
        # Retorna o texto após a tag de resposta
        return generated_text[response_start + len(response_start_tag):].strip()
    
    return "Erro ao gerar cenários."


# =========================================================================
# === 4. EXECUÇÃO PRINCIPAL ===
# =========================================================================

# Chamada da função para carregar o modelo
tokenizer, model = load_code_llama()

if model:
    # Cenário de teste complexo
    user_story_exemplo = (
        "Como usuário, quero me cadastrar em um novo sistema. O campo 'Nome' deve ter "
        "no mínimo 3 e no máximo 50 caracteres. O campo 'Senha' deve ter entre 8 e 16 caracteres, "
        "incluindo pelo menos uma letra maiúscula e um número. O campo 'Email' deve ser único e formatado corretamente."
    )
    
    print("\n--- Processando User Story... ---")
    
    # Chamada da nova função!
    cenarios = generate_test_scenarios(tokenizer, model, user_story_exemplo)
    
    print("\n=================================")
    print("🤖 Cenários Gerados pelo AI-QA Agent:")
    print("=================================")
    print(cenarios)
    print("---------------------------------")