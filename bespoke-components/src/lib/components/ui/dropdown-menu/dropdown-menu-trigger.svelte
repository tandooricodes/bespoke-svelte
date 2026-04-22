<script>
	import { getContext } from 'svelte';

	/** @type {{ children?: import('svelte').Snippet, class?: string, [key: string]: any }} */
	let { children, class: className, ...restProps } = $props();

	const ctx = /** @type {{ open: boolean, toggle: () => void, close: () => void }} */ (
		getContext('dropdown')
	);
</script>

<button
	type="button"
	aria-haspopup="menu"
	aria-expanded={ctx.open}
	onclick={(e) => {
		e.stopPropagation();
		ctx.toggle();
	}}
	class={className}
	{...restProps}
>
	{@render children?.()}
</button>
