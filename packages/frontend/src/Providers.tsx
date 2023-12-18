import { wagmiConfig, chains } from '@/lib/wagmi'
import { WagmiConfig } from 'wagmi'
import { RainbowKitProvider } from '@rainbow-me/rainbowkit'

export const Providers = ({ children }: { children: React.ReactNode }) => {
  return (
    <WagmiConfig config={wagmiConfig}>
      <RainbowKitProvider chains={chains}>{children}</RainbowKitProvider>
    </WagmiConfig>
  )
}
