# DevCalc — Project Plan

A working document. Updated as I learn.

## Current focus
Standard calculator — finishing MVP (post-evaluate, formatting, copy)

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
- [ ] Copy result to clipboard (ClipboardService + cubit method + button + snackbar)
- [ ] `%` button — DEFERRED to polish. Context-sensitive:
      after +/− = percentage of previous operand;
      after ×/÷ or alone = divide by 100.
      Currently disabled (no-op onPressed).

### Other MVP features (not started)
- [ ] Standard calculator
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
- [ ] Use FittedBox(fit: BoxFit.scaleDown) on MainText to auto-shrink long results/errors
- [ ] Style MainText in error color when status == error
- [ ] Refactor PreviewText to switch expression (consistency with MainText)
- [ ] 30 → 30.sp for the error fontSize override

## Notes / decisions
- State management: flutter_bloc (Cubit)
- Persistence: hive_ce (chosen for offline-first requirement + simple API)
- Math parsing: math_expressions package (wrapped via ExpressionEvaluator)
- Consider get_it for service registration once we have 3+ services.
