# Desafio DIO

## Desafio 1 - Projeto do Relatório de finanças elegante com Power BI

Este projeto desenvolveu a criação de um relatório interativo no Power BI. 

Itens considerados:

- Estrutura definida: inclusão de textos e distribuição dos visuais na página de forma a harmonizar a estrutura;
  
- Botões de navegação para facilitar a navegabilidade: foram adicionados botões para navegação entre as páginas 1 e 2;
  
- Segmentadores de dados: Filtro de ano para visualização das páginas;

-  Botões com imagens associadas: inclusão de botão para limpar a segmentação de dados;
  
- Utilização de indicadores e botões para selecionar diferentes visuais sobre um mesmo assunto: utilização de botões para alternar entre visuais na segunda página;

O relatório segue o modelo proposto nas aulas com alteração pequenas no layout e conjunto de cores, bem como construção de gráficos diferentes.

Relatório criado localmente.

Fork e alterações realizadas em nova branch no GitHub: Link: [[theresaportella:theresaportella-powerbi-desafioDIO](https://github.com/theresaportella/power_bi_analyst.git)](https://github.com/theresaportella/power_bi_analyst.git)

Pull request realizado: Link: https://github.com/julianazanelatto/power_bi_analyst/pull/11

## Desafio 2 - Processando e Transformando Dados com Power BI

### Banco de Dados e Tabelas
Conexão realizada com o banco de dados "2021 Olympics in Tokyo" obtido pelo link: https://www.kaggle.com/datasets/arjunprasadsarkhel/2021-olympics-in-tokyo;

Conexão às seguintes tabelas:
1. Athletes.xlsx
2. Medals.xlsx
   
Com foco nas atividades necessárias para o desafio, as outras tabelas não foram consideradas.

### Tratamento tabelas

#### Athletes
Etapas realizadas:
1. Ajuste do nome da tabela;
2. Usar a Primeira Linha como Cabeçalho;
3. Não foi necessário ajuste de tipo para nenhuma das colunas;
4. Remoção de Duplicatas
     = Table.Distinct(#"Tipo Alterado1")
5. Extração do Sobrenome a partir do campo "Name"
     = Table.RenameColumns(#"Texto Inserido Antes do Delimitador",{{"Texto Antes do Delimitador", "SOBRENOME"}})

#### Medals
Etapas realizadas:
1. Ajuste do nome da tabela;
2. Remoção da coluna Total, Rnak e Rank by Total - não são necessárias;
      = Table.RemoveColumns(#"Tipo Alterado",{"Rank", "Total", "Rank by Total"})
3. Transformar Colunas em Linhas
      = Table.UnpivotOtherColumns(#"Colunas Removidas", {"Team/NOC"}, "Atributo", "Valor")
4. Renomear colunas
      = Table.RenameColumns(#"Colunas Não Dinâmicas",{{"Atributo", "Medal"}, {"Valor", "# Medals"}, {"Team/NOC", "NOC"}})
5. Remover Linhas em branco/nulo da coluna NOC
     = Table.SelectRows(#"Colunas Renomeadas", each [NOC] <> null and [NOC] <> "")
6. Não foi necessário ajuste de tipo para nenhuma das colunas;

### Relacionamentos Tabelas

1. Duplicar Consulta "Athletes"
2. Manter a coluna NOC (remover todas as outras colunas)
3. Remover duplicatas
4. Alterar nome da consultar para "NOC"
5. No menu "Exibição do Modelo" > Gerenciar Relações > Detecção Automática

### Preparação para análises e Criação de Medidas

Num_Athletes = DISTINCTCOUNT(Athletes[Name])
Num_Discipline = DISTINCTCOUNT(Athletes[Discipline])

Perguntas respondidas na construção visual a partir do tratamento de dados anterior:
- quais os países que tiveram participação de maior número de atletas na olimpíada?
- quais os países que participaram de mais modalidades diferentes?




