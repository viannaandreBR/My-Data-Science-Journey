def soma(a, b, c):
    somatorio = a + b + c
    return somatorio


def mult(a, b, c):
    produto = a * b * c
    return produto


def divisao(a, b):
    divide = a / b
    return divide


def isPalindromo(string):
    # abccba
    if string == string[::-1]:
        return True
    else:
        return False


s = soma(3, 4, 5)
m = mult(3, 4, 5)
print('O valor da soma é', s)
print('O valor da multiplicação é', m)
