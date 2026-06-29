return {
    -- Core DAP
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")

            -- 🔥 FastAPI / Uvicorn config
            dap.configurations.python = {
                {
                    type = "python",
                    request = "launch",
                    name = "FastAPI (uvicorn)",
                    module = "uvicorn",
                    args = {
                        "main:app", -- 🔁 change this to your file:app
                        -- "--reload", -- ⚠️ optional (can cause issues with debugger)
                    },
                    justMyCode = true,
                },
            }
        end,
    },

    -- UI
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio", -- ✅ FIXED
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },

    -- Python debugger (conda-aware)
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            local dap_python = require("dap-python")

            -- fallback
            dap_python.setup("python")

            -- 🔥 conda-aware interpreter (Windows)
            dap_python.resolve_python = function()
                local conda_prefix = os.getenv("CONDA_PREFIX")

                if conda_prefix then
                    return conda_prefix .. "\\python.exe"
                end

                return "python"
            end
        end,
    },

    -- Inline variable values (like VSCode)
    {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
            require("nvim-dap-virtual-text").setup()
        end,
    },
}
