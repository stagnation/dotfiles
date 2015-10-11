#!/usr/bin/python3
import subprocess
import argparse


def main():
    parser = argparse.ArgumentParser(description="small wrapper for tag programs not compatible with ctags flags")

    parser.add_argument('-f', '--output',
                        help="output tagfile",
                        )
    parser.add_argument('-a', '--append',
                        help="append to tagfile",
                        action='store_true',
                        )
    parser.add_argument('--options',
                        help="options file",
                        )

    args, input = parser.parse_known_args()
    input = [ i.strip('"') for i in input ]

    tagprogram = 'fast-tags'

    execute = [tagprogram] + input
    if args.output:
        execute += ['-o', args.output]
    print(execute)

    p = subprocess.Popen(execute)
    p.communicate()

if __name__ == '__main__':
    main()
