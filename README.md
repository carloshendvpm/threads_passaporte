# Comparação de Algoritmos de Ordenação com Ruby e Python

Este projeto visa comparar o desempenho de três algoritmos de ordenação diferentes (BubbleSort, QuickSort e MergeSort) utilizando **Ruby** para execução paralela e **Python** com **Matplotlib** para visualização dos resultados e foi feito durante o passaporte de Outubro da Real Seguro Viagem.

## Visão Geral do Projeto

O projeto realiza as seguintes etapas:

1. **Execução dos Algoritmos em Paralelo**: Utilizando threads em Ruby, executamos cada algoritmo com arrays de tamanhos variados (de 10.000 a 100.000 elementos).
2. **Medição e Registro do Tempo de Execução**: Para cada execução, medimos o tempo de processamento e salvamos os resultados em um arquivo `results.csv`.
3. **Plotagem dos Gráficos**: Em Python, lemos o `results.csv` e utilizamos Matplotlib para visualizar e comparar o desempenho dos algoritmos em função do tamanho dos arrays.

## Estrutura do Projeto

- **algorithms.rb**: Contém a implementação dos algoritmos de ordenação (BubbleSort, QuickSort e MergeSort).
- **sort_runner.rb**: Script principal que executa os algoritmos em paralelo, mede o tempo e salva os resultados em `results.csv`.
- **plot_results.py**: Script Python que lê o arquivo `results.csv` e gera gráficos comparando o desempenho dos algoritmos.
- **samples.txt**: Arquivo JSON contendo amostras de arrays gerados aleatoriamente para serem ordenados.

## Pré-requisitos

- **Ruby** instalado (versão 2.5 ou superior).
- **Python** instalado (versão 3.6 ou superior).
- Bibliotecas Python necessárias: `pandas` e `matplotlib`.

Instale as dependências Python com:

```bash
pip install pandas matplotlib
```

## Instruções de Uso

### Passo 1: Gerar Arrays Aleatórios

Execute o script abaixo para gerar arrays de tamanhos variados e salvar no arquivo `samples.txt`:

```bash
ruby generate_samples.rb
```

### Passo 2: Executar Algoritmos de Ordenação

Execute o script para realizar a ordenação e registrar os tempos:

```bash
ruby sort_runner.rb
```

Esse script faz o seguinte:

- Lê os arrays do arquivo `samples.txt`.
- Executa BubbleSort, QuickSort e MergeSort em threads paralelas para cada tamanho de array.
- Salva os resultados no arquivo `results.csv`.

### Passo 3: Gerar o Gráfico de Desempenho

Use o script Python para ler os resultados e gerar um gráfico comparativo:

```bash
python plot_results.py
```

Este script gera e exibe um gráfico `sorting_performance.png` com o tempo de execução em função do tamanho do array para cada algoritmo.

## Exemplo de Resultados

O gráfico comparativo mostra como cada algoritmo se comporta com o aumento do tamanho do array:

- **BubbleSort**: Tem crescimento quadrático \(O(n^2)\), apresentando um aumento rápido no tempo de execução.
- **QuickSort e MergeSort**: Ambos têm complexidade média \(O(n \log n)\) e apresentam um crescimento mais controlado.

## Estrutura do Arquivo CSV (`results.csv`)

O arquivo `results.csv` contém as seguintes colunas:

- **Algorithm**: Nome do algoritmo de ordenação.
- **Size**: Tamanho do array.
- **Time**: Tempo de execução em segundos.

## Explicação Teórica

Os algoritmos de ordenação têm diferentes complexidades de tempo:

- **BubbleSort**: \(O(n^2)\), tem desempenho inferior para arrays grandes.
- **QuickSort**: \(O(n \log n)\) no caso médio, é eficiente para a maioria dos casos.
- **MergeSort**: \(O(n \log n)\) no pior caso, garante boa performance mesmo em grandes conjuntos de dados.

O gráfico gerado ilustra essas diferenças de complexidade, destacando o crescimento exponencial do BubbleSort em comparação ao crescimento mais linear de QuickSort e MergeSort.