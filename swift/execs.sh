#!/bin/bash
git clone https://github.com/fcanas/scrape.git && cd scrape && swift build -c release && cp ./.build/x86_64-apple-macosx10.10/release/scrape ~/bin/
