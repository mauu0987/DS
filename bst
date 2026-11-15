class Node:
    def __init__(self, key):
        self.key = key
        self.left = None
        self.right = None


class BST:
    def __init__(self):
        self.root = None

    # Insert element in BST
    def insert_element(self, root, key):
        if root is None:
            return Node(key)
        elif key < root.key:
            root.left = self.insert_element(root.left, key)
        elif key > root.key:
            root.right = self.insert_element(root.right, key)
        else:
            print(f"Element {key} already exists in the BST.")
        return root

    # Search element in BST
    def search_element(self, root, key):
        if root is None:
            return None
        if root.key == key:
            return root
        elif key < root.key:
            return self.search_element(root.left, key)
        else:
            return self.search_element(root.right, key)

    # Find the node with minimum value
    def find_min(self, node):
        current = node
        while current.left is not None:
            current = current.left
        return current

    # Delete element from BST
    # Returns (new_root, deleted_flag)
    def delete_element(self, root, key):
        if root is None:
            return root, False

        if key < root.key:
            root.left, deleted = self.delete_element(root.left, key)
            return root, deleted

        elif key > root.key:
            root.right, deleted = self.delete_element(root.right, key)
            return root, deleted

        else:
            # Node found
            # Case 1: No left child
            if root.left is None:
                return root.right, True

            # Case 2: No right child
            elif root.right is None:
                return root.left, True

            # Case 3: Two children
            successor = self.find_min(root.right)
            root.key = successor.key
            root.right, _ = self.delete_element(root.right, successor.key)
            return root, True

    # Display (In-order traversal)
    def display_BST(self, root):
        if root:
            self.display_BST(root.left)
            print(root.key, end=" ")
            self.display_BST(root.right)

    # Menu for operations
    def menu(self):
        while True:
            print("\n----- MENU -----")
            print("1. Insert element in BST")
            print("2. Search element in BST")
            print("3. Delete element from BST")
            print("4. Display BST (In-order Traversal)")
            print("5. Exit")

            try:
                choice = int(input("Enter your choice: "))
            except ValueError:
                print("Invalid input. Please enter a number.")
                continue

            if choice == 1:
                key = int(input("Enter element to insert: "))
                self.root = self.insert_element(self.root, key)
                print(f"Element {key} inserted in BST.")

            elif choice == 2:
                key = int(input("Enter element to search: "))
                result = self.search_element(self.root, key)

                if result:
                    print(f"Element {key} found in BST.")
                else:
                    print(f"Element {key} not found in BST.")

            elif choice == 3:
                key = int(input("Enter element to delete: "))
                self.root, deleted = self.delete_element(self.root, key)
                if deleted:
                    print(f"Element {key} deleted from BST")
                else:
                    print(f"Element {key} is not found. Deletion not performed")

            elif choice == 4:
                if self.root is None:
                    print("BST is empty.")
                else:
                    print("BST (In-order Traversal): ", end="")
                    self.display_BST(self.root)
                    print()

            elif choice == 5:
                print("Exiting...")
                break

            else:
                print("Invalid choice! Try again.")


# Main program
obj1 = BST()
obj1.menu()
