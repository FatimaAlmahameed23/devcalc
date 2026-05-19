enum NumberBase {
  bin(radix: 2, label: 'BIN'),
  oct(radix: 8, label: 'OCT'),
  dec(radix: 10, label: 'DEC'),
  hex(radix: 16, label: 'HEX');

  final int radix;
  final String label;
  const NumberBase({required this.radix, required this.label});

  Set<String> get validDigits => switch (this) {
    NumberBase.bin => const 
    {'0', '1'},
    NumberBase.oct => const {'0', '1', '2', '3', '4', '5', '6', '7'},
    NumberBase.dec => const {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'},
    NumberBase.hex => const {
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
    },
  };
}
