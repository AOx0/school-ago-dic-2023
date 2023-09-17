import os
import sys


def main():
    arg = sys.argv[1]
    if arg is None:
        print("Falta indicar un número de ejercicio")
        sys.exit(1)
    ejercicio = None
    try:
        ejercicio = int(arg)
    except Exception:
        print("Ingrese un número de ejercicio válido 1..=6")
        sys.exit(1)

    # print(f"{ejercicio}")

    if not os.path.exists("./out/"):
        os.makedirs("./out/")

    if ejercicio is not None and 1 <= ejercicio <= 6:
        os.system(f"flex -L src/ejercicio{ejercicio}.lex")
        os.system(f"gcc lex.yy.c -o ./out/ejercicio{ejercicio}")

    if len(sys.argv) >= 4 and sys.argv[2] == "--":
        print(f"Ejecutando ejercicio{ejercicio} con \
los argumentos \"{' '.join(sys.argv[3:])}\"")
        os.system(f"./out/ejercicio{ejercicio} {' '.join(sys.argv[3:])}")
    else:
        print(f"Ejecutando ejercicio{ejercicio}")
        os.system(f"./out/ejercicio{ejercicio}")


if __name__ == "__main__":
    main()
