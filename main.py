class SearchEngine:
    def __init__(self):
        self.data = {}

    def add_data(self, key, value):
        self.data[key] = value

    def search(self, query):
        results = []
        for key, value in self.data.items():
            if query in key or query in value:
                results.append((key, value))
        return results

    def delete_data(self, key):
        if key in self.data:
            del self.data[key]

    def update_data(self, key, value):
        if key in self.data:
            self.data[key] = value

def main():
    search_engine = SearchEngine()
    while True:
        print("1. Add data")
        print("2. Search")
        print("3. Delete data")
        print("4. Update data")
        print("5. Exit")
        choice = input("Choose an option: ")
        if choice == "1":
            key = input("Enter key: ")
            value = input("Enter value: ")
            search_engine.add_data(key, value)
        elif choice == "2":
            query = input("Enter search query: ")
            results = search_engine.search(query)
            if results:
                for result in results:
                    print(f"{result[0]}: {result[1]}")
            else:
                print("No results found")
        elif choice == "3":
            key = input("Enter key: ")
            search_engine.delete_data(key)
        elif choice == "4":
            key = input("Enter key: ")
            value = input("Enter new value: ")
            search_engine.update_data(key, value)
        elif choice == "5":
            break
        else:
            print("Invalid choice")

if __name__ == "__main__":
    main()