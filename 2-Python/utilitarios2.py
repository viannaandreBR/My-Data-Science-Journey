def soma(a,b,c):
    somatorio = a + b + c
    return somatorio

def mult(a,b,c):
    produto = a * b * c
    return produto

def isPalindromo(string):
    # abccba
    if string == string[::-1]:
        return True
    else:
        return False
    
soma(3,4,5)
mult(3,4,5)