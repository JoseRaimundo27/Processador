# Projeto de Processador com Pipeline para FPGA

Este repositório contém o desenvolvimento de um **soft-core de processador** projetado para ser sintetizado em **FPGAs de baixo custo**. O projeto foi realizado como parte da disciplina **ENGG56 - Projeto de Circuitos Integrados Digitais** na **Universidade Federal da Bahia (UFBA)**, com o objetivo de aplicar conceitos de **paralelismo em nível de instrução (ILP)** e explorar técnicas de microarquitetura.

## Descrição Geral

O projeto consiste na implementação de uma **CPU com pipeline de 5 estágios**, acompanhada por **memórias separadas de instruções (RAM)** e **dados (ROM)**. O processador foi projetado para ser compatível com um conjunto específico de instruções do tipo **RISC**, permitindo operações aritméticas, lógicas e de controle de fluxo.

## Características Principais

### Pipeline de 5 estágios para execução paralela:
- **Fetch**: Busca da instrução na RAM de instruções.
- **Decode**: Decodificação da instrução e geração de sinais de controle.
- **Execute**: Execução de operações aritméticas/lógicas na ULA.
- **Memory**: Acesso à memória (leitura/escrita).
- **Write Back**: Escrita do resultado em registradores.

### Arquitetura RISC com as seguintes especificações:
- **32 registradores de propósito geral** (R0 a R31), com R0 fixo em 0 e R1 fixo em 1.
- **Modos de endereçamento**:
  - Imediato.
  - Base-deslocamento.
  - Registrador.

### Memórias:
- **RAM** (instruções): Suporte a leitura/escrita.
- **ROM** (dados): Memória somente leitura, inicializada com valores predefinidos.

### Conjunto de Instruções:
- **Operações aritméticas**: ADD, SUB, MUL, DIV.
- **Operações lógicas**: AND, OR, SHL, SHR, NOT, CMP.
- **Transferência de dados**: LW, SW, MOV.
- **Controle de fluxo**: JR, JPC, BRFL, CALL, RET, NOP.

## Estrutura do Projeto

O projeto está dividido em módulos **Verilog**, cada um representando uma parte funcional do processador:

- **top**: Módulo principal que integra a CPU, RAM de instruções e ROM de dados.
- **CPU**:
  - **UC (Unidade de Controle)**: Decodificação das instruções e geração de sinais de controle.
  - **ULA (Unidade Lógica e Aritmética)**: Execução de operações aritméticas e lógicas.
  - **Banco de Registradores**: Armazena valores intermediários e resultados.
- **Memórias**:
  - **RAM**: Memória de leitura/escrita para instruções.
  - **ROM**: Memória somente leitura para dados.

## Objetivos de Aprendizado

- Compreender e aplicar conceitos de paralelismo em nível de instrução (ILP).
- Implementar uma microarquitetura com pipeline em Verilog.
- Utilizar ferramentas de síntese digital como **Quartus Prime** e **ModelSim**.
- Analisar hazards de dependências de dados e controle, implementando soluções para evitar paralisações no pipeline.

## Instruções de Uso

1. **Clone o repositório**:

    ```bash
    git clone https://github.com/seu-usuario/nome-do-repositorio.git
    cd nome-do-repositorio
    ```

2. **Abra o projeto no Quartus Prime**.
3. **Compile o código** e visualize o esquemático gerado.
4. **Simule o funcionamento no ModelSim**:
   - Teste o pipeline com diferentes instruções.
   - Valide o comportamento das memórias (RAM/ROM) e do banco de registradores.
5. **Sintetize o design para a FPGA DE2-115** e valide em hardware.

## Ferramentas Utilizadas

- **Quartus Prime Lite Edition (v18.1)**: Para síntese e mapeamento de FPGA.
- **ModelSim**: Para simulação funcional e temporal.
- **Intel FPGA Cyclone IV**: Plataforma alvo.
