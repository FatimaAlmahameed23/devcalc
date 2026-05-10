# DevCalc — Project Plan

A working document. Updated as I learn.

## Current focus
Standard calculator — logic layer (cubit)

## MVP checklist

### Standard calculator
- [x] Display area widget
- [x] Keypad widget (visual)
- [x] CalculatorState model
- [x] CalculationResult sealed type
- [x] ExpressionEvaluator
- [ ] CalculatorCubit
- [ ] Wire buttons to cubit
- [ ] Wire display to cubit (BlocBuilder)
- [ ] Copy result to clipboard
- [ ] Number formatting (commas, decimal precision)

### Other MVP features (not started)
- [ ] Programmer mode
- [ ] Color converter
- [ ] Base64 encoder/decoder
- [ ] Timestamp converter
- [ ] History (with hive_ce persistence)

## Polish backlog (post-MVP)
- [ ] Refactor keypad to data-driven layout (CalculatorButton config + named constructors)
- [ ] Replace `dynamic` label type in _CalcButton with `.text` / `.icon` constructors
- [ ] Switch `.h` to `.w` for horizontal padding in keypad
- [ ] Comment why `lightTextNeutral` and `lightTextTertiary` share the same hex
- [ ] Consider AppColors.Dark / .Light nested-class refactor
- [ ] Haptic feedback on button presses

## Notes / decisions
- State management: flutter_bloc (Cubit)
- Persistence: hive_ce (chosen for offline-first requirement + simple API)
- Math parsing: math_expressions package (wrapped via ExpressionEvaluator)