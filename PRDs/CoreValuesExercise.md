# 🧭 Product Requirements Document (PRD)

## Feature: Interactive Core Values Exercise

**Prepared for:** GreatProg  
**Owner:** Bruno Azenha  
**Date:** April 19, 2025

---

## ✨ Overview

This feature is an interactive coaching exercise designed to help users discover and rank their core personal values. The process involves selecting meaningful values, comparing them in a series of choices, and arriving at a prioritized list. The outcome reveals their **Top 5 values**, providing self-awareness, alignment, and a foundation for conscious decision-making.

---

## 🎯 Goals

- Help users **identify and prioritize** their core values.
- Create a **visually engaging, user-friendly** experience.
- Empower reflection and alignment between values and actions.
- Generate **shareable results** to encourage deeper exploration or conversation with a coach.

---

## 👤 Target Users

- Tech leaders, coaching clients, and curious self-developers.
- Visitors to GreatProg looking for meaningful, interactive growth tools.

---

## 🛠️ Functional Requirements

### 1. Values Selection Screen
- Display a **large list of values** (~80–100), organized into **categories**:
  - Relationships
  - Career
  - Self
  - Society
  - Spirituality
  - Adventure
- Users can **hover/tap for tooltips** with brief definitions or examples.
- Allow users to **select up to 20 values**.
- Display real-time count (e.g., “17 of 20 selected”).
- UX: Multi-column layout with filters or search functionality.

### 2. Comparison Stage (Pairwise Sorting)
- Present **two values at a time**: “Which one feels more essential to you right now?”
- Use **Insert Sort logic** to rank based on comparisons.
- Show progress (e.g., “6 of 24 comparisons completed”).
- Users can **undo last choice** if needed.

### 3. Results Summary Screen
- Display the **Top 20 values** ranked from 1–20.
- Highlight the **Top 5** with visuals (color blocks, icons, etc.).
- For each Top 5 value:
  - Show name and brief definition.
  - Include a **reflective question** (e.g., “How are you currently honoring this value?”).
  - Offer a **journal prompt** or action suggestion.

### 4. Optional Features
- Allow users to **email results** or **download a PDF**.
- “Reflect with a coach” CTA (e.g., book a session with Bruno).
- Save progress via cookies or optional login.

---

## 🧠 Non-Functional Requirements

- Mobile-responsive design.
- Fast load times, intuitive UX.
- Support for accessibility (screen reader-friendly).
- Ensure user data privacy (no storage unless opted in).

---

## 🧩 Sample Value Categories & Samples

| Category        | Sample Values                               |
|-----------------|---------------------------------------------|
| **Personal**    | Integrity, Growth, Curiosity, Simplicity    |
| **Relationships**| Love, Honesty, Empathy, Loyalty             |
| **Career**      | Achievement, Innovation, Impact, Learning   |
| **Spiritual**   | Connection, Grace, Mindfulness, Wonder      |
| **Society**     | Justice, Service, Equity, Sustainability    |
| **Adventure**   | Freedom, Risk-taking, Discovery, Play       |

---

## 💡 User Journey Summary

1. **Discovery** – User visits the “Values Exercise” page.
2. **Selection** – Picks 20 values from categorized list.
3. **Comparison** – Completes pairwise comparisons.
4. **Results** – Views ranked list and reflects on Top 5.
5. **Action** – Journals, downloads results, or books a session.

---

## 🪄 Coaching Touchpoints (Optional)

- Gentle reflection quotes throughout (e.g., “There are no wrong values, only deeper truths.”)
- After Top 5 reveal, include a metaphor like:
  > “These are the roots of your inner tree — nourishing everything above.”
- Integration ideas like:
  > “This week, act from your #1 value once per day.”
