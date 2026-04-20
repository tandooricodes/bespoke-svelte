<script>
	import './layout.css';
	import { Navbar } from '$lib/index.js';

	const { children } = $props();
</script>

<Navbar title="Bespoke" />
{@render children()}
