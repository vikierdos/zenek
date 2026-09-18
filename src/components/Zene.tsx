import type { ZeneTipus } from "../adat";
import "../css/zene.css";

interface zeneProps {
  zenem: ZeneTipus
}

function Zene({ zenem }: zeneProps) {
  return (
    <div className="zene">
      <img
        className="zene-art"
        src={zenem.kep}
        alt={`${zenem.eloado} – ${zenem.cim}`}
        width={216}
        height={216}
      />
      <h2>{zenem.cim}</h2>
      <p>
        <span>Előadó:</span> {zenem.eloado}
      </p>
      <p>
        <span>Műfaj:</span> {zenem.mufaj}
      </p>
    </div>
  );
}

export default Zene;
