# Interface Design for Testability

Good interfaces make testing natural:

- Accept dependencies, don't create them.

```typescript
// Testable
function processOrder(order, paymentGateway) {}

// Hard to test
function processOrder(order) {
 const gateway = new StripeGateway();
}
```

- Return results, don't produce side effects.

```typescript
// Testable
function calculateDiscount(cart): Discount {}

// Hard to test
function applyDiscount(cart): void {
 cart.total -= discount;
}
```

- Small surface area.
  - Fewer methods = fewer tests needed
  - Fewer params = simpler test setup
