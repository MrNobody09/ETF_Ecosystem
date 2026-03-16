import Link from "next/link";

export default function HomePage() {
  return (
    <main>
      <h1>ETF Agent OS</h1>
      <p>AI-powered ETF research platform.</p>
      <ul>
        <li><Link href="/search">Search ETFs</Link></li>
        <li><Link href="/compare">Compare ETFs</Link></li>
        <li><Link href="/agents">Agents Dashboard</Link></li>
      </ul>
    </main>
  );
}
