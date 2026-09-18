import "../css/zenek.css";
import type { ZeneTipus } from "../adat";
import Zene from "./Zene";
interface zenekProps {
  lista: ZeneTipus[]
}

export default function Zenek({ lista }: zenekProps) {
    return (
        <div className="zenek">
        {
            lista.map((e) => (
                <Zene key={e.id} zenem={e} />
            ))
        }
        </div>
    )
}
