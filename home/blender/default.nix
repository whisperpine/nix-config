{ pkgs, ... }:
# --- the freedom to create --- #
{
  home.packages = with pkgs; [
    # Enable "cudaSupport" to use OptiX in Cycles render.
    (blender.override { cudaSupport = true; })
  ];
}
