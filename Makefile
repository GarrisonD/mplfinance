setup:
	pip install mplfinance pyarrow # install pyarrow only to get rid of pandas warning

test:
	sudo apt remove -y fonts-liberation
	rm -f ~/.cache/matplotlib/fontlist-v330.json
	FILE=1-without-liberation-fonts/image.png python script.py 2> 1-without-liberation-fonts/mpl-debug-logs.txt

	sudo apt update
	sudo apt install fonts-liberation
	rm -f ~/.cache/matplotlib/fontlist-v330.json
	FILE=2-with-liberation-fonts/image.png python script.py 2> 2-with-liberation-fonts/mpl-debug-logs.txt

	echo && md5sum 1-without-liberation-fonts/image.png 2-with-liberation-fonts/image.png && echo
	echo && tail -n 1 1-without-liberation-fonts/mpl-debug-logs.txt 2-with-liberation-fonts/mpl-debug-logs.txt
