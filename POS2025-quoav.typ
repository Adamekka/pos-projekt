#import "@preview/ilm:1.4.1": *

#set text(lang: "cs")

#show: ilm.with(
  title: "Počítačové Sítě (POS)\nquoav",
  author: "Adam Cvikl (CVI0014), Ondřej Kaňák (KAN0313)",
  date: datetime(year: 2025, month: 11, day: 1),
  date-format: "[day padding:none].[month padding:zero].[year repr:full]",
  abstract: text(hyphenate: false, size: 11pt)[
    VYSOKÁ ŠKOLA BÁŇSKÁ - TECHNICKÁ UNIVERZITA OSTRAVA\
    FAKULTA ELEKTROTECHNIKY A INFORMATIKY
  ],
  figure-index: (enabled: false),
  table-index: (enabled: false),
  listing-index: (enabled: false),
  table-of-contents: none,
)

#set text(lang: "cs", font: "Comic Sans MS")
#set heading(numbering: none)

= Zadání

Navrhněte a zdokumentujte konfiguraci podnikové sítě připojené do Internetu. Řešení po částech realizujte, otestujte a odevzdejte elektronicky konfigurace a protokoly, dokládající
funkčnost způsobem, stanoveným cvičícím/tutorem.

\

== Firma quoav

#table(
  columns: (auto, auto),
  align: (left, left),
  [Číslo topologie:], [F],
  [Čísla VLAN:], [VLAN A = 132\ VLAN B = 194],
  [Počty stanic na segmentech:], [VLAN A = 133\ VLAN B = 34\ Segment S1 = 238],
  [Rozsah veřejných adres:], [129.120.112.0/21],
  [Rozsah privátních adres:], [172.17.102.128/26],
  [Rozsah IPv6 adres:], [2001:426c:5597:a000::/52],
  [Zvláštní segmenty:], [NAT: VLAN B\ DNS: Segment S1 (PC3)\ DHCP: VLAN A\ T: Segment S1\ N: Segment S1],
  [NAT pool:], [52],
  [Směrovací protokol:], [OSPF],
)

= Topologie F

#figure(image("assets/topologie.png"))

= Ekvivalentní L3 topologie

#figure(image("assets/l3topologie.png"))

= VLSM IPv4

== Veřejné adresy

#text(size: 9pt)[
  #table(
    columns: (auto, auto, auto, auto, auto),
    align: (left, left, left, left, left),
    [Segment], [Adresa/maska], [Nejmenší], [Největší], [Broadcast],
    [S1], [129.120.112.0/24], [129.120.112.1], [129.120.112.254], [129.120.112.255],
    [VLAN A], [129.120.113.0/24], [129.120.113.1], [129.120.113.254], [129.120.113.255],
    [NAT], [129.120.114.0/26], [129.120.114.1], [129.120.114.62], [129.120.114.63],
    [R1-R2], [129.120.114.64/30], [129.120.115.65], [129.120.115.66], [129.120.115.67],
    [R1-R3], [129.120.115.68/30], [129.120.115.69], [129.120.115.70], [129.120.115.71],
  )
]

== Privátní adresy

#text(size: 9pt)[
  #table(
    columns: (auto, auto, auto, auto, auto),
    align: (left, left, left, left, left),
    [Segment], [Adresa/maska], [Nejmenší], [Největší], [Broadcast],
    [VLAN B], [172.17.102.128/26], [172.17.102.129], [172.17.102.190], [172.17.102.191],
  )
]

== ISP

#text(size: 9pt)[
  #table(
    columns: (auto, auto, auto, auto, auto),
    align: (left, left, left, left, left),
    [Segment], [Adresa/maska], [Nejmenší], [Největší], [Broadcast],
    [R1-ISP], [10.0.0.0/30], [10.0.0.1], [10.0.0.2], [10.0.0.3],
  )
]

= IPv6

#text(size: 8pt)[
  #table(
    columns: (auto, auto, auto, auto),
    align: (left, left, left, left),
    [Segment], [Adresa/maska], [Nejmenší], [Největší],
    [S1], [2001:426c:5597:a000::/64], [2001:426c:5597:a000::], [2001:426c:5597:a000:ffff:ffff:ffff:ffff],
    [VLAN A], [2001:426c:5597:a001::/64], [2001:426c:5597:a001::], [2001:426c:5597:a001:ffff:ffff:ffff:ffff],
    [NAT], [2001:426c:5597:a002::/64], [2001:426c:5597:a002::], [2001:426c:5597:a002:ffff:ffff:ffff:ffff],
    [R1-R2], [2001:426c:5597:a003::/64], [2001:426c:5597:a003::], [2001:426c:5597:a003:ffff:ffff:ffff:ffff],
    [R1-R3], [2001:426c:5597:a004::/64], [2001:426c:5597:a004::], [2001:426c:5597:a004:ffff:ffff:ffff:ffff],
    [VLAN B], [2001:426c:5597:a005::/64], [2001:426c:5597:a005::], [2001:426c:5597:a005:ffff:ffff:ffff:ffff],
  )
]

= DNS

DNS segment S1 (PC3)

Adresa DNS: 129.120.112.254
