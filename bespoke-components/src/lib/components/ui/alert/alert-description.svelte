<script>
	import { cn } from '../../../utils.js';

	let { ref = $bindable(null), class: className = '', children, ...restProps } = $props();
</script>

<div
	bind:this={ref}
	data-slot="alert-description"
	class={cn(
		'text-sm text-balance text-muted-foreground md:text-pretty [&_a]:underline [&_a]:underline-offset-3 [&_a]:hover:text-foreground [&_p:not(:last-child)]:mb-4',
		className
	)}
	{...restProps}
>
	{@render children?.()}
</div>
