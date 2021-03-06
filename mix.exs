defmodule NervesSystemNanopiAir.Mixfile do
  use Mix.Project

  @version Path.join(__DIR__, "VERSION")
    |> File.read!
    |> String.strip

  def project do
    [app: :nerves_system_nanopi_neo,
     version: @version,
     elixir: "~> 1.3",
     compilers: Mix.compilers ++ [:nerves_package],
     description: description(),
     package: package(),
     deps: deps(),
     aliases: ["deps.precompile": ["nerves.env", "deps.precompile"]]
   ]
  end

  def application do
    []
  end

  defp deps do
    [{:nerves, "~> 0.5.1", runtime: false},
     {:nerves_system_br, "~> 0.10.1", runtime: false},
     {:nerves_toolchain_arm_unknown_linux_gnueabihf, "~> 0.10.0", runtime: false}]
  end

  defp description do
    """
    Nerves System - NanoPi Air
    """
  end

  defp package do
    [maintainers: ["Stefan Sachse"],
     files: ["rootfs-additions", "busybox_defconfig", "LICENSE",
             "mix.exs", "nerves_defconfig", "nerves.exs", "README.md",
             "VERSION", "fwup.conf", "post-createfs.sh", "uboot",
             "uboot-script.cmd", "linux"],
     licenses: ["Apache 2.0"],
     links: %{"Github" => "https://github.com/ssachse/nerves_system_nanopi_air"}]
  end
end
