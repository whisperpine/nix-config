{ pkgs-blender, ... }:
# --- the freedom to create --- #
{
  home.packages = with pkgs-blender; [
    # Enable "cudaSupport" to use OptiX in Cycles render.
    (blender.override { cudaSupport = true; })
  ];
}
