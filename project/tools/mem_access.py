import matplotlib.pyplot as plt

def plot_memory_access(addresses):
    """Visualize memory access patterns"""
    plt.figure(figsize=(10, 4))
    plt.scatter(range(len(addresses)), addresses, s=1)
    plt.ylabel("Memory Address")
    plt.xlabel("Access Sequence")
    plt.title("Memory Access Pattern")
    plt.show()

# Example usage with simulated addresses
if __name__ == "__main__":
    sample_addrs = [i*4 for i in range(100)] + [50*4]*10
    plot_memory_access(sample_addrs)
