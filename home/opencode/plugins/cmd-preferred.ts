import { Plugin } from "@opencode/plugin";

/** An opencode plugin that forces choosing the preferred command. */
export default Plugin.define({
  id: "yusong.cmd-preferred",
  async setup(ctx): Promise<void> {
    await ctx.tool.hook("execute.before", (event) => {
      if (event.tool === "bash") {
        const command = (event.input as { command: string }).command;
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
    });
  },
});

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
