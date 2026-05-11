# DevCalc — Project Plan

A working document. Updated as I learn.

## Current focus
Standard calculator MVP complete. Next: History feature (hive_ce persistence).


## MVP checklist

### Standard calculator
- [x] Display area widget
- [x] Keypad widget (visual)
- [x] CalculatorState model
- [x] CalculationResult sealed type
- [x] ExpressionEvaluator
- [x] CalculatorCubit
- [x] Wire buttons to cubit
- [x] Wire display to cubit (BlocBuilder)
- [x] Post-evaluate behavior (digit starts fresh, operator continues from result)
- [x] Number formatting (drop trailing .0, add thousands separators)
- [x] Copy result to clipboard (ClipboardService + cubit method + button + snackbar)
- [x] `%` button — DEFERRED to polish. Context-sensitive:
      after +/− = percentage of previous operand;
      after ×/÷ or alone = divide by 100.
      Currently disabled (no-op onPressed).

### Other MVP features (not started)
- [x] Standard calculator
- [ ] Programmer mode
- [ ] Color converter
- [ ] Base64 encoder/decoder
- [ ] Timestamp converter
- [ ] History (with hive_ce persistence)

## Notes / decisions
- State management: flutter_bloc (Cubit)
- Persistence: hive_ce (chosen for offline-first requirement + simple API)
- Math parsing: math_expressions package (wrapped via ExpressionEvaluator)
- Consider get_it for service registration once we have 3+ services.
