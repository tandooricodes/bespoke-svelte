<script>
	import { cn } from '../../../utils.js';

	/** @type {{ children?: import('svelte').Snippet, class?: string, [key: string]: any }} */
	let { children, class: className, ...restProps } = $props();
</script>

<div class={cn('px-2 py-1.5 text-xs font-semibold text-muted-foreground', className)} {...restProps}>
	{@render children?.()}
</div>
