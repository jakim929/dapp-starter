import '@rainbow-me/rainbowkit/styles.css'

import { envVars } from '@/lib/envVars'
import { Chain, configureChains, createConfig } from 'wagmi'
import {
  base,
  baseGoerli,
  foundry,
  optimism,
  optimismGoerli,
} from 'wagmi/chains'
import { jsonRpcProvider } from 'wagmi/providers/jsonRpc'
import { getDefaultWallets } from '@rainbow-me/rainbowkit'

const chainById: Record<number, Chain> = {
  [optimism.id]: optimism,
  [optimismGoerli.id]: optimismGoerli,
  [base.id]: base,
  [baseGoerli.id]: baseGoerli,
  [foundry.id]: foundry,
}

const chain = chainById[envVars.VITE_CHAIN_ID]

const { chains, publicClient } = configureChains(
  [chain],
  [
    jsonRpcProvider({
      rpc: () => ({
        http: envVars.VITE_JSON_RPC_HTTP_URL,
      }),
    }),
  ],
)

const { connectors } = getDefaultWallets({
  appName: 'DApp Starter',
  projectId: envVars.VITE_WALLET_CONNECT_PROJECT_ID,
  chains: chains as any,
})

export const wagmiConfig = createConfig({
  autoConnect: true,
  connectors: connectors as any,
  publicClient,
})

export { chains }
