import type { Plugin } from "@opencode-ai/plugin";

/** An opencode plugin that forces choosing the preferred command. */
export const cmdPreferredPlugin: Plugin = async () => {
  return {
    "tool.execute.before": async (input, output) => {
      if (input.tool === "bash") {
        const command: string = output.args.command as string;
        const violation: CmdPreference | null = detectCmdViolation(
          command,
          preferences,
        );

        if (violation) {
          const alt: string = violation.alternatives.join(", ");
          throw new Error(
            `Blocked: '${violation.preferred}' is preferred over [${alt}]. ` +
              `Use '${violation.preferred}' instead. ` +
              `Original command: ${command}`,
          );
        }
      }
    },
  };
};

function detectCmdViolation(
  command: string,
  preferences: CmdPreference[],
): CmdPreference | null {
  const words: string[] = command.trim().split(/\s+/);
  const first: string = words[0];

  for (const pref of preferences) {
    if (pref.alternatives.includes(first)) {
      return pref;
    }
  }
  return null;
}

interface CmdPreference {
  preferred: string;
  alternatives: string[];
  reason?: string;
}

const preferences: CmdPreference[] = [
  {
    preferred: "bun",
    alternatives: ["npm", "pnpm", "yarn"],
  },
  {
    preferred: "bunx",
    alternatives: ["npx", "pnx"],
  },
  {
    preferred: "uv",
    alternatives: ["pip", "pip3"],
  },
  {
    preferred: "uvx",
    alternatives: ["pipx"],
  },
  {
    preferred: "tofu",
    alternatives: ["terraform"],
  },
];
