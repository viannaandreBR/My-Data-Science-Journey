# -*- coding: utf-8 -*-
"""
Created on Sun Jun 16 22:36:39 2019

@author: Gustavo Suto 
"""
class data_prep:

    
    
    def breveDescricao(df):
        """
        Função breveDescricao
        
        Objetivo: Exclui atributos que estejam com colunas com todos os valores
        'NaN'. Imprime na tela a quantidade de atributos/campos e a quantidade
        de registros.
        
        Argumentos: um DataFrame.
        """
        
        df.dropna(axis=1, how="all", inplace=True)
    
        print("O data set possui: \n- {} atributos/campos; e \n- {} registros.\n".
          format(df.shape[1], df.shape[0]))
        df.info()
    
    
    
    def serieNulos(df, corte = 50):
        """
         responsável: Suto
         data: 04/05/19
        
        objetivo: essa função retorna uma tupla com:
                 (1) contendo uma pd.series com os atributos com maior
                 proporção de nulos; e
                 (2) uma string indicando quantos atributos estão com uma
                 proporção de nulos acima do corte dado.
                 argumentos: são necessários 2 argumentos:
                 (1) dataframe df - base que se deseja verificar quantos nulos
                 têm; e
                 (2) float corte - número entre 0 e 100 para indicar o valor
                 mínimo da proporção de nulos. 
        
        Argumentos: Um DataFrame e um corte em porcentagem (valor padrão é 50%).
        
        """
        serie = (df.isnull().sum().sort_values(ascending=False)/len(df))*100
        return (serie[serie > corte], ("-> {} atributos/features/campos possuem mais de {}% de valores nulos.".
                format(len(serie[serie > corte]),corte)))
    
    def cardinalidade(df):
        """
        responsável: suto
        data: 27/10/19
        objetivo:   essa função retorna um dataframe com os atributos não
                    numéricos e sua respectiva cardinalidade em ordem crescente. 
        Argumentos: somente 01 (um) argumento, o DataFrame que se deseja
                    analisar.
        """
        import pandas as pd
        
        df_temporario = df.select_dtypes(exclude=["float64"])

        matriz_cardialidade = []

        for i, coluna in df_temporario.items():
            matriz_cardialidade.append([i, len(df_temporario[i].unique()), sorted(df_temporario[i].unique())])
            
        matriz_cardialidade = pd.DataFrame(matriz_cardialidade, columns=["Atributo", "Cardinalidade", "Valores"])
        matriz_cardialidade.sort_values(by="Cardinalidade", inplace=True, ascending=True)
        
        return matriz_cardialidade
    
    def cardinalidadeComDescricao(df):
        """
        responsável: suto
        data: 27/10/19
        objetivo: essa função retorna dois dataframes.
            (1) O primeiro com a descrição dos atributos numéricos (int ou
            float); e
            (2) O segundo com os atributos não numéricos e sua respectiva
            cardinalidade em ordem crescente. 
        argumentos: somente 01 (um) argumento, o DataFrame que se deseja
                    analisar.
        """
        import pandas as pd
        
        df_temporario = df.select_dtypes(exclude=["int64", "float64"])

        matriz_cardialidade = []

        for i, coluna in df_temporario.items():
            matriz_cardialidade.append([i, len(df_temporario[i].unique())])
            
        matriz_cardialidade = pd.DataFrame(matriz_cardialidade, columns=["Atributo", "Cardinalidade"])
        matriz_cardialidade.sort_values(by="Cardinalidade", inplace=True, ascending=True)
        
        return matriz_cardialidade.T, df.describe()
    
    
    
    def r2_ajustado(x, y, y_pred):
        """
        responsável: Suto
        data: 23/11/19
        
        r2_ajustado retorna o R² Ajustado e recebe como argumento as séries com
        o valor alvo teste e o predito.
        """
        n = x.shape[0]
        k = x.shape[1]
        return (1-((n-1)/(n-(k+1)))*(1-r2_score(y, y_pred)))