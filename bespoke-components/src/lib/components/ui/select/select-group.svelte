<script>
	import { cn } from '../../../utils.js';

	/** @type {{ children?: import('svelte').Snippet, class?: string, [key: string]: any }} */
	let { children, class: className, ...restProps } = $props();
</script>

<div role="group" class={cn('overflow-hidden', className)} {...restProps}>
	{@render children?.()}
</div>
