.data # En la seccion data se declaran y se inicializan las variables
numero1: .asciiz "Ingrese el primer numero: " # Se ingresa el primer numero
numero2: .asciiz "Ingrese el segundo numero: "  # Se ingresa el segundo numero 
numero3: .asciiz "Ingrese el tercer numero: " # Se ingresa el tercer numero
numero_menor: .asciiz "El numero menor es: " # Aca se mostrara el menor numero de los tres ingresados 

.text # En la seccion text se almacenan las instrucciones que son ejecutadas por el procesador MIPS
.globl main

main:
    # Registro del primer numero
    # La instruccion move se utiliza para copiar el valor de un registro y almacenarlo en otro
    li $v0, 4         # Llamada al sistema para imprimir una cadena
    la $a0, numero1  # Se carga la direccion de numero1 en $a0
    syscall           # Llamada al sistema para imprimir el mensaje
    
    li $v0, 5     # Se carga una llamada al sistema para leer un entero
    syscall       # Llamada al sistema para leer un entero
    move $t0, $v0   # Se traslada el numero ingresado a $t0 

    # Registro del segundo numero
    li $v0, 4         # Llamada al sistema para imprimir una cadena
    la $a0, numero2   # Se carga la direccion de numero2 en $a0
    syscall           # Llamada al sistema para imprimir el mensaje

    li $v0, 5     # Se carga una llamada al sistema para leer un entero
    syscall       # Llamada al sistema para leer un entero
    move $t1, $v0  # Se traslada el numero ingresado a $t1

    # Registro del tercer numero
    li $v0, 4         # Llamada al sistema para imprimir una cadena
    la $a0, numero3  # Se carga la direccion de numero2 en $a0
    syscall           # Llamada al sistema para imprimir el mensaje

    li $v0, 5     # Se carga una llamada al sistema para leer un entero
    syscall       # Llamada al sistema para leer un entero
    move $t2, $v0  # Se traslada el numero ingresado a $t2

    # Encontrar el numero menor
    # La instruccion slt compara dos enteros y establece el el valor de un registro de destino a 1 si el primero es menor que el segundo, de lo contrario lo establece en 0
    move $t3, $t0       # Se deja el primer numero como el menor
    slt $t4, $t1, $t0   # Se compara el segundo numero con el primero
    beq $t4, $zero, compara  # Si el segundo numero no es mas pequeno, pasa a verificar el tercer numero

    move $t3, $t1       # si el segundo numero es mas pequeno, actualizar el numero menor

# La instruccion beq permite el redireccionamiento basado en el valor de dos registros
compara:
    slt $t4, $t2, $t3   # Comparar el tercer numero con el mas pequeno
    beq $t4, $zero, mostrar  # Si el tercer numero no es mas pequeno, pasar a imprimir el numero menor de los tres

    move $t3, $t2       # Si el tercer numero es menor, actualizar el numero menor

mostrar:
    
    li $v0, 4         # Llamada al sistema para imprimir una cadena
    la $a0, numero_menor    # Se carga la direccion del numero_menor
    syscall           # Llamada al sistema para imprimir el numero_menor

    li $v0, 1         # Llamada al sistema para imprimir un entero
    move $a0, $t3     # Trasada el numero menor para registrar $a0 como un argumento
    syscall           # Llamada al sistema para imprimir el numero menor

