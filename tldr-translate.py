#!/usr/bin/env python3

# Find the next TLDR page to translate from English to the chosen target
# language. Python >= 3.2 required.
#
# Author: Marco Bonelli.

import os
import sys
import shutil
import argparse

def get_args():
	p = argparse.ArgumentParser()
	p.add_argument('language', metavar='LANGUAGE', type=str, help='target language (e.g. it)')
	p.add_argument('-c', '--copy-only', action='store_true', help='only copy the file, without opening it in the text editor')
	return p.parse_args()

##########################

args = get_args()

english     = set()
translated  = set()
eng_path    = 'pages'
target_path = 'pages.' + args.language

if not os.path.isdir(target_path):
	print('No such directory:', target_path, file=sys.stderr)
	sys.exit(1)

for platform in os.listdir(eng_path):
	base = os.path.join(eng_path, platform)
	english |= set((platform, page) for page in os.listdir(base))

for platform in os.listdir(target_path):
	base = os.path.join(target_path, platform)
	translated |= set((platform, page) for page in os.listdir(base))

for page in sorted(english):
	if page not in translated:
		english_fname = os.path.join(eng_path, *page)
		target_fname  = os.path.join(target_path, *page)
		target_dir    = os.path.join(target_path, page[0])

		os.makedirs(target_dir, exist_ok=True)
		shutil.copy(english_fname, target_fname)

		if args.copy_only:
			print('Next page is: {}'.format(target_fname))
		else:
			editor_cmd = 'editor {}'.format(target_fname)
			print(editor_cmd)
			os.system(editor_cmd)

		break