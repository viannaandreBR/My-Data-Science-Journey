import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns

def plot_bar_accumulated_line(*, df: pd.DataFrame, feature: str, threshold: float = 2) -> None:
    """Plot a seaborn barplot with the accumulated lineplot in percentage.

    Args:
        df (pd.DataFrame): target dataframe.
        column (str): feature that needs to be analyzed.
        threshold (float, optional): minimum individual percentage of a class. Defaults to 2.

    Returns:
        None
    """

    count_product = pd.DataFrame(100*df[feature].value_counts()/df[feature].value_counts().sum())
    count_product.rename(columns={feature: "% occurence"}, inplace=True)
    count_product["% accumulated"] = count_product["% occurence"].cumsum()

    count_product = count_product[count_product["% occurence"]>=threshold]
    count_product = round(count_product, 1)

    a4_dims = (8, 5)
    fig, ax = plt.subplots(figsize=a4_dims)

    # sns.color_palette("rocket", as_cmap=True)
    ax = sns.lineplot(data=count_product, x=count_product["% accumulated"], y=count_product.index, color="red")
    ax.set_xlim(10, 100)
    ax1 = plt.twiny()
    ax2 = sns.barplot(x=count_product["% occurence"], y=count_product.index, ax=ax1, palette='rocket')
    ax2.set_xlim(0, 50)
    ax2.bar_label(ax2.containers[0]);