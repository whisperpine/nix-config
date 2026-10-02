import { Plugin } from "@opencode/plugin";

/** An opencode plugin that bans certain commands. */
export default Plugin.define({
  id: "yusong.cmd-banned",
  async setup(ctx): Promise<void> {
    await ctx.tool.hook("execute.before", (event) => {
      if (event.tool === "bash") {
        const command = (event.input as { command: string }).command;
        const violation: string | null = detectCmdViolation(
          command,
          bannedCmds,
        );

        if (violation) {
          throw new Error(
            `Blocked: '${violation}' is banned. DO NOT try to workaround. ` +
              `Stop here and wait for human's instruction.`,
          );
        }
      }
    });
  },
});

function detectCmdViolation(
  command: string,
  bannedCmds: string[],
): string | null {
  for (const bannedCmd of bannedCmds) {
    if (command.includes(bannedCmd)) {
      return bannedCmd;
    }
  }
  return null;
}

const bannedCmds: string[] = [
  // Credential management.
  "sops",
  // Infrastructure as Code (IaC).
  "tofu",
  "terraform",
  "pulumi",
  "wrangler",
  "ansible-playbook",
  // Git.
  "git push -f",
  "git push --force",
  "git push --force-with-lease",
  "git reset --hard",
  "git branch -D",
  "git push origin -d",
  "git push -d origin ",
  "git push origin --delete",
  "git push --delete origin ",
  // Docker.
  "docker volume rm",
  "docker compose down -v",
  "docker compose down --volume",
  // Kubernetes.
  "kubectl",
  // Filesystem.
  "rm -f",
  "rm -rf",
  "chmod",
  "chown",
  // Networking.
  "ssh",
  "wget",
];
