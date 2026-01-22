# Scam Frontend - Agent Instructions

This document provides context and guidelines for AI agents working on the `scams-frontend` repository.

## 1. Project Overview
- **Type**: React v19 + TypeScript v5.9 + Vite v7 application.
- **Styling**: Tailwind CSS v4 using `shadcn/ui` components ("new-york" style).
- **State**: React Context API (`AppProvider`).
- **Routing**: `react-router-dom` v7.

## 2. Operational Commands

### Build & Lint
- **Install Dependencies**: `npm install`
- **Development Server**: `npm run dev`
- **Build**: `npm run build` (runs `tsc -b && vite build`)
- **Lint**: `npm run lint` (runs `eslint .`)
- **Type Check**: `tsc -b` (often part of build)

### Testing
- **Status**: There are currently **no** configured test scripts (Jest/Vitest) in `package.json`.
- **Action**: Do not attempt to run `npm test`. If asked to write tests, check if you need to set up a test environment first or if you should just verify manually via `npm run dev`.

## 3. Code Style & Conventions

### General
- **Language**: TypeScript (`.ts`, `.tsx`).
- **Path Aliases**: Use `@/` to refer to `src/` (e.g., `@/components/ui/button`, `@/lib/utils`).
- **Formatting**: Follow standard Prettier/ESLint formatting. 2-space indentation.

### Naming Conventions
- **Files/Components**: PascalCase (e.g., `ParticleNetwork.tsx`, `EditBookingDialog.tsx`).
- **Hooks**: camelCase, prefixed with `use` (e.g., `useCommandPalette`).
- **Functions/Variables**: camelCase (e.g., `handleCreateBooking`, `isLoading`).
- **Types/Interfaces**: PascalCase.

### Component Structure
- Use functional components with typed props.
- **Exports**: Prefer named exports or `export default function` matching the filename.
- **Props**: Define interfaces for props, e.g., `interface Props { ... }`.
- **Hooks**: Place hooks at the top of the component.

### Styling (Tailwind + Shadcn)
- **Utility**: Use the `cn()` utility from `@/lib/utils` for merging classes.
  ```tsx
  import { cn } from "@/lib/utils";
  <div className={cn("bg-red-500", className)}>...</div>
  ```
- **Shadcn Components**: located in `@/components/ui`. reuse these whenever possible.
- **Icons**: Use `lucide-react` (e.g., `import { Bell } from "lucide-react"`).

### State & Logic
- **Context**: Global state is handled in `contexts/AppContext.tsx`.
- **Toasts**: Use `sonner` for notifications (`<Toaster />` is in `App.tsx`).
- **Error Handling**: 
  - Wrap critical sections in `<ErrorBoundary>`.
  - Use `try/catch` for async operations and show user feedback via toasts.

### TypeScript Config
- **Strictness**: `noImplicitAny` is technically enforced by TS but `no-explicit-any` rule is turned OFF in ESLint.
- **Best Practice**: Avoid `any` where possible, but the project is lenient.

## 4. Directory Structure
- `src/components/ui`: Generic UI components (buttons, inputs).
- `src/components/dialogs`: Modal implementations.
- `src/contexts`: React Context definitions.
- `src/hooks`: Custom React hooks.
- `src/lib`: Utilities (`utils.ts`).
- `src/routes`: Route definitions (`AuthRoutes`, `UserRoutes`).

## 5. Important Notes
- **Reverting**: Do not revert changes unless explicitly requested.
- **Placeholders**: If you need an image or asset that doesn't exist, use a placeholder or describe what should be there.
- **Files**: Always use absolute paths when reading/writing files (e.g., `/home/tea/dev/ASE-project/scams-frontend/src/App.tsx`).
