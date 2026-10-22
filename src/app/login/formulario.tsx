"use client";

import { Button, FieldError, Input, Label, TextField } from "@heroui/react";
import { useActionState } from "react";

import { iniciarSesion } from "@/lib/auth/acciones";

export function FormularioLogin({ desde }: { desde: string }) {
  const [estado, accion, pendiente] = useActionState(iniciarSesion, undefined);

  return (
    <form action={accion} className="mt-6 flex flex-col gap-4">
      <input type="hidden" name="desde" value={desde} />

      <TextField name="email" type="email" isRequired autoComplete="email">
        <Label>Email</Label>
        <Input placeholder="admin@salesdejujuy.ju-min.local" />
        <FieldError />
      </TextField>

      <TextField
        name="clave"
        type="password"
        isRequired
        autoComplete="current-password"
      >
        <Label>Contraseña</Label>
        <Input placeholder="ju-min-demo" />
        <FieldError />
      </TextField>

      {estado?.error && (
        <p role="alert" className="text-detalle font-medium text-destructive">
          {estado.error}
        </p>
      )}

      <Button
        type="submit"
        variant="primary"
        fullWidth
        isDisabled={pendiente}
        className="font-display font-semibold"
      >
        {pendiente ? "Ingresando…" : "Ingresar"}
      </Button>
    </form>
  );
}
