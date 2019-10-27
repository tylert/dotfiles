#!/usr/bin/env python

import re
from sys import stdin, stdout

ticket_regex = re.compile('(?<![-A-Za-z])([A-Za-z]{1,}\-[0-9]+)')

ignore = []

tickets = set([])
for line in iter(stdin.readline, ''):
    result = ticket_regex.findall(line)
    if result:
        tickets.update(result)

for ticket in sorted({x for x in tickets if x.split('-')[0] not in ignore},
                     key=lambda x: (x.split('-')[0], int(x.split('-')[1]))):
    print(ticket)
