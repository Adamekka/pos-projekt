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

\

= Topologie F

#figure(image("assets/topologie.png"))

= Ekvivalentní L3 topologie

#figure(image("assets/l3topologie.png"))
