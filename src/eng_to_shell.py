import subprocess

def main():
    while True:
        user_input = input("Enter a command in English (or 'quit' to exit): ")
        if user_input.lower() == 'quit':
            break
        
        command = f"./src/eng_to_shell.sh '{user_input}'"
        try:
            result = subprocess.run(command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            print(result.stdout.decode('utf-8'))
        except subprocess.CalledProcessError as e:
            print(f"Error: {e.stderr.decode('utf-8')}")

if __name__ == "__main__":
    main()
