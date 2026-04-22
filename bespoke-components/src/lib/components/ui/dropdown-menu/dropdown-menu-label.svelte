<script>
	import { cn } from '../../../utils.js';

	/** @type {{ children?: import('svelte').Snippet, class?: string, inset?: boolean, [key: string]: any }} */
	let { children, class: className, inset = false, ...restProps } = $props();
</script>

<div
	class={cn('px-2 py-1.5 text-xs font-semibold text-muted-foreground', inset && 'pl-8', className)}
	{...restProps}
>
	{@render children?.()}
</div>
