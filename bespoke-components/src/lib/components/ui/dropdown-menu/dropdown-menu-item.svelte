<script>
	import { getContext } from 'svelte';
	import { cn } from '../../../utils.js';

	/** @type {{
	 *   children?: import('svelte').Snippet,
	 *   class?: string,
	 *   inset?: boolean,
	 *   disabled?: boolean,
	 *   onclick?: (e: MouseEvent) => void,
	 *   [key: string]: any
	 * }} */
	let {
		children,
		class: className,
		inset = false,
		disabled = false,
		onclick,
		...restProps
	} = $props();

	const ctx = /** @type {{ open: boolean, toggle: () => void, close: () => void }} */ (
		getContext('dropdown')
	);
</script>

<div
	role="menuitem"
	tabindex={disabled ? -1 : 0}
	aria-disabled={disabled}
	onclick={(e) => {
		if (disabled) return;
		onclick?.(e);
		ctx.close();
	}}
	onkeydown={(e) => {
		if (disabled) return;
		if (e.key === 'Enter' || e.key === ' ') {
			e.preventDefault();
			onclick?.(/** @type {any} */ (e));
			ctx.close();
		}
	}}
	class={cn(
		'relative flex cursor-pointer items-center gap-2 rounded-sm px-2 py-1.5 text-sm transition-colors outline-none select-none hover:bg-accent hover:text-accent-foreground focus:bg-accent focus:text-accent-foreground',
		inset && 'pl-8',
		disabled && 'pointer-events-none opacity-50',
		className
	)}
	{...restProps}
>
	{@render children?.()}
</div>
