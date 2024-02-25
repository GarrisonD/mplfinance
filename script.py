import os

import matplotlib.pyplot as plt
import pandas as pd

import mplfinance as mpf

plt.set_loglevel("debug")

window = pd.DataFrame(
    [
        [2.00, 4.00, 1.00, 3.00],
    ],
    columns=["open", "high", "low", "close"],
)

window.index = pd.date_range("2022-01-01", periods=len(window), freq="D")

mpf.plot(window, type="candle", savefig=os.environ["FILE"])
