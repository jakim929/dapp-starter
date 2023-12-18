import { ConnectButton } from '@rainbow-me/rainbowkit'

import { Providers } from '@/Providers'

function App() {
  return (
    <Providers>
      <div className="h-full w-full flex flex-col">
        <div className="flex p-4 justify-between">
          <div className="font-mono text-xl font-semibold">Tools</div>
          <ConnectButton />
        </div>
        <div className="flex-1 flex flex-col justify-center items-center"></div>
      </div>
    </Providers>
  )
}

export default App
