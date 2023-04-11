.data # En la seccion data se declaran y se inicializan las variables
numero1: .asciiz "Ingrese el primer numero: " # Se ingresa el primer numero
numero2: .asciiz "Ingrese el segundo numero: "  # Se ingresa el segundo numero 
numero3: .asciiz "Ingrese el tercer numero: " # Se ingresa el tercer numero
numero_mayor:  .asciiz "El numero mayor es: " # Aca se mostrara el mayor numero de los tres ingresados 

.text # En la seccion text se almacenan las instrucciones que son ejecutadas por el procesador MIPS
.globl main

main:
    # Registro del primer numero
    # La instruccion move se utiliza para copiar el valor de un registro y almacenarlo en otro
    li $v0, 4          # Llamada al sistema para imprimir una cadena
    la $a0, numero1    # Se carga la direccion de numero1 en $a0
    syscall            # Llamada al sistema para imprimir el mensaje
    li $v0, 5          # Se carga una llamada al sistema para leer un entero
    syscall            # Llamada al sistema para leer un entero
    move $s0, $v0      # Se traslada el numero ingresado a $s0 

    # Registro del segundo numero
    li $v0, 4          # Llamada al sistema para imprimir una cadena
    la $a0, numero2    # Se carga la direccion de numero2 en $a0
    syscall            # Llamada al sistema para imprimir el mensaje
    li $v0, 5          # Se carga una llamada al sistema para leer un entero
    syscall            # Llamada al sistema para leer un entero
    move $s1, $v0      # Se traslada el numero ingresado a $s1

    # Registro del tercer numero
    li $v0, 4          # Llamada al sistema para imprimir una cadena
    la $a0, numero3    # Se carga la direccion de numero2 en $a0
    syscall            # Llamada al sistema para imprimir el mensaje
    li $v0, 5          # Se carga una llamada al sistema para leer un entero
    syscall            # Llamada al sistema para leer un entero
    move $s2, $v0      # Se traslada el numero ingresado a $s2

    # Encontrar el numero mas grande
    # La instruccion slt compara dos enteros y establece el el valor de un registro de destino a 1 si el primero es menor que el segundo, de lo contrario lo establece en 0
    move $t0, $s0      # Mueve el primer numero a $t0
    slt $t1, $s0, $s1  # Establece $t1 en 1 si $s0 < $s1, de lo contrario 0
    movn $t0, $s1, $t1  # Mueve el segundo numero a $t0 si $s0 < $s1
    slt $t1, $t0, $s2  # Establece $t1 en 1 si $t0 < $s2, de lo contrario 0
    movn $t0, $s2, $t1  # Mueve el tercer numero a $t0 si $t0 < $s2

    # Se imprime el resultado
    li $v0, 4          # Se carga una llamada al sistema para imprimir una cadena
    la $a0, numero_mayor     # Se carga la direccion de la variable numero_mayor en $a0
    syscall            # Llamada al sistema para imprimir numero_mayor
    move $a0, $t0      # El numero mas grande se traslada a $a0
    li $v0, 1          # Se carga llamada al sistema para imprimir un entero
    syscall            # Llamada al sistema para imprimir el numero mayor

    # Se indica la salida del programa
    li $v0, 10
